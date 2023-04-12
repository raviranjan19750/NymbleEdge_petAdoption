
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/color_constants.dart';
import '../utils/local_icons.dart';

class ExitPopUp extends StatelessWidget {
  const ExitPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(

            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width*0.8,
            alignment: Alignment.center,

            decoration:  BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(32)),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(LocalIcons.lottieSleepyDogAnimation,height: 200, repeat: true, fit: BoxFit.contain),

                const SizedBox(height: 8,),

                Text("Exit", style: Theme.of(context).textTheme.titleLarge,),

                const SizedBox(height: 8,),

                Text("Do you want to exit?", style: Theme.of(context).textTheme.labelMedium,),

                const SizedBox(height: 24,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(

                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                              color: ColorConstants.greenMatte,
                              width: 1,
                            )
                        ),
                        child:  Text("Cancel", textAlign: TextAlign.end, style: Theme.of(context).textTheme.labelSmall,),
                      ),
                    ),

                    const SizedBox(width: 16,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorConstants.greenMatte,
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                              color: ColorConstants.greenMatte,
                              width: 1,
                            )
                        ),
                        child:  Text("OK", textAlign: TextAlign.end, style:TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10)),
                      ),
                    ),
                  ],
                )



              ],
            )
        ),
      ),
    );

  }
}
