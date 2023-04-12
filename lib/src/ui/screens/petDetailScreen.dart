import 'package:flutter/material.dart';
import 'package:pet_adoption/model/pet_data.dart';
import 'package:pet_adoption/src/ui/utils/color_constants.dart';
import 'package:pet_adoption/src/ui/widgets/adopted_dialog.dart';

import '../utils/local_icons.dart';
import '../utils/routes.dart';

class PetDetailScreen extends StatefulWidget {
  const PetDetailScreen({Key? key, this.petDataItem})
      : super(key: key);
  final PetDataItem? petDataItem;

  @override
  State<PetDetailScreen> createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(


          backgroundColor: Theme.of(context).backgroundColor,
            body: Stack(
              fit: StackFit.passthrough,
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.photoViewerScreen,
                      arguments:{"id" : widget.petDataItem?.id, "asset" :  widget.petDataItem?.imageURL ?? ""});
                },
                child: Hero(
                    tag: "dog_${widget.petDataItem?.id}",
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.petDataItem?.imageURL ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Expanded(
                  child: Container(
                    color:Theme.of(context).backgroundColor,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, bottom: 16, top: 16),
                    child: Text(
                      "This space here is for the description of dog. One can describe about the breed, health, color, any personal health related issues, medical advise can be mentioned here.",
                      maxLines: 3,
                      style: Theme.of(context).textTheme.labelMedium
                    ),
                  ),
                ),
                Container(
                  // adoption button

                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 12.0, // soften the shadow
                        spreadRadius: 8.0, //extend the shadow
                        offset: const Offset(
                          0.0, // Move to right 5  horizontally
                          0.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(32.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(32.0),
                        bottomLeft: Radius.circular(0.0)),
                  ),

                  child: InkWell(
                    onTap: () {
                      if (widget.petDataItem?.isAdopted == true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar( SnackBar(
                          duration: Duration(seconds: 1),

                          content: Text("Already adopted", ),
                        ));
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AdoptedDialog(petName: widget.petDataItem?.name,)).then((value) {
                              Navigator.of(context).pop(widget.petDataItem?.id);
                        });

                        widget.petDataItem?.isAdopted = true;
                        // if (widget.onChange != null) {
                        //   widget.onChange!(widget.petDataItem?.id);
                        // }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 36),
                      foregroundDecoration:
                          widget.petDataItem?.isAdopted == true
                              ? const BoxDecoration(
                                  color: Colors.grey,
                                  backgroundBlendMode: BlendMode.saturation,
                                )
                              : const BoxDecoration(),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            blurRadius: 12.0, // soften the shadow
                            spreadRadius: 8.0, //extend the shadow
                            offset: const Offset(
                              0.0, // Move to right 5  horizontally
                              0.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        color: ColorConstants.greenMatte,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(200.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            LocalIcons.pawGreenMatte,
                            height: 22,
                            width: 22,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.petDataItem?.isAdopted == true
                                ? "Already Adopted"
                                : "Adopt Me",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.4),
                blurRadius: 12.0, // soften the shadow
                spreadRadius: 4.0, //extend the shadow
                offset: const Offset(
                  0.0, // Move to right 5  horizontally
                  0.0, // Move to bottom 5 Vertically
                ),
              )
            ],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0),
                topLeft: Radius.circular(32.0),
                bottomLeft: Radius.circular(32.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.petDataItem?.name ?? "",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "Breed",
                    style: Theme.of(context).textTheme.labelMedium
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "${widget.petDataItem?.age} year(s) old",
                      style: Theme.of(context).textTheme.labelMedium
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text(
                    "₹",
                    style: TextStyle(
                        color: ColorConstants.greenMatte,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.petDataItem?.price.toString() ?? "",
                    style: const TextStyle(
                        color: ColorConstants.greenMatte,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),

        Positioned(
          top: 16,
            left: 0,
            child: IconButton(onPressed: Navigator.of(context).pop, icon: Icon(Icons.arrow_back)))

      ],
    )));
  }
}
