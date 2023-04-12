
import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption/src/ui/utils/color_constants.dart';

import '../utils/local_icons.dart';

class AdoptedDialog extends StatelessWidget {
   AdoptedDialog({Key? key, this.petName = ""}) : super(key: key);
   String? petName;

   final ConfettiController _confettiController  = ConfettiController(duration: const Duration(seconds: 10));


  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 3), () {
      _confettiController.play();
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(

          height: MediaQuery.of(context).size.height*0.6,
          width: MediaQuery.of(context).size.width*0.8,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration:  BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(32)),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(

                children: [

                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 200,
                        width: 200,
                    child: Lottie.asset(LocalIcons.lottieDogAnimation, height: 300, repeat: true, fit: BoxFit.cover),

                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _confettiController, //attach object created
                      shouldLoop: true,
                      blastDirection: -3.14 / 2,
                      colors:  const [Colors.orange, Colors.blue, Colors.green],
                      gravity: 0.3,
                      numberOfParticles: 5,
                      createParticlePath: drawStar,
                    ),
                    )

                ],
              ),
               Text("You’ve now adopted $petName", textAlign: TextAlign.center,style: Theme.of(context).textTheme.labelMedium,),

                const SizedBox(height: 24,),

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
                    child:  Text("Close", textAlign: TextAlign.end, style: Theme.of(context).textTheme.labelSmall,),
                  ),
                )



            ],
          )
        ),
      ),
    );
  }

   Path drawStar(Size size) {
     // Method to convert degree to radians
     double degToRad(double deg) => deg * (pi / 180.0);
     const numberOfPoints = 5;
     final halfWidth = size.width / 2;
     final externalRadius = halfWidth;
     final internalRadius = halfWidth / 2.5;
     final degreesPerStep = degToRad(360 / numberOfPoints);
     final halfDegreesPerStep = degreesPerStep / 2;
     final path = Path();
     final fullAngle = degToRad(360);
     path.moveTo(size.width, halfWidth);
     for (double step = 0; step < fullAngle; step += degreesPerStep) {
       path.lineTo(halfWidth + externalRadius * cos(step),
           halfWidth + externalRadius * sin(step));
       path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
           halfWidth + internalRadius * sin(step + halfDegreesPerStep));
     }
     path.close();
     return path;
   }
}
