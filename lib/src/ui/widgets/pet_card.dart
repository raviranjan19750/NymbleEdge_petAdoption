
import 'package:flutter/material.dart';
import 'package:pet_adoption/model/pet_data.dart';
import 'package:pet_adoption/src/ui/utils/color_constants.dart';

class PetCard extends StatelessWidget {
  const PetCard({Key? key, this.petDataItem, this.isAdoptedTab = false}) : super(key: key);

  final PetDataItem? petDataItem;
  final bool isAdoptedTab;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 16),

      child: Row(
        children: [
          Container(
              height: 132,
              width: 116,

              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.12),
                      blurRadius: 12.0,
                      // soften the shadow
                      spreadRadius: 8.0,
                      //extend the shadow
                      offset: const Offset(
                        0.0,
                        // Move to right 5  horizontally
                        0.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                  borderRadius:
                  const BorderRadius.all(
                      Radius.circular(20))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20), // Image radius
                  child: Container(
                      foregroundDecoration: petDataItem?.isAdopted == true && !isAdoptedTab? const BoxDecoration(
                        color: Colors.grey,
                        backgroundBlendMode: BlendMode.saturation,
                      ) : const BoxDecoration(),

                      child: Hero(
                          tag: "dog_${petDataItem?.id}",
                          child: Image.asset(petDataItem?.imageURL??"", fit: BoxFit.cover))),
                ),
              )
          ),
          Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 16),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16),
                decoration: BoxDecoration(
                  color:Theme.of(context).backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color:
                      Theme.of(context).shadowColor,
                      blurRadius: 12.0,
                      // soften the shadow
                      spreadRadius: 8.0,
                      //extend the shadow
                      offset: const Offset(
                        0.0,
                        // Move to right 5  horizontally
                        0.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight:
                      Radius.circular(12.0),
                      topLeft: Radius.circular(0.0),
                      bottomLeft: Radius.circular(0.0)),
                ),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      petDataItem?.name??"",
                      style: Theme.of(context).textTheme.labelLarge,

                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${petDataItem?.age} year(s) old",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                     Text(
                      "Male",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "₹ ${petDataItem?.price}",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
