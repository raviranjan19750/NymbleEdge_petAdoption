import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption/src/ui/utils/color_constants.dart';

import '../utils/local_icons.dart';

class EmptyStateWidget extends StatelessWidget {
  EmptyStateWidget(
      {this.title = "",
      this.description = "",
      this.assetImageColor = ColorConstants.greenMatte,
      this.assetImagePath = "",
      Key? key})
      : super(key: key);
  String title;
  String description;
  String assetImagePath;
  Color assetImageColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 32),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Lottie.asset(LocalIcons.lottieHappyDogAnimation, repeat: true, fit: BoxFit.scaleDown),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              )),

        ],
      ),
    );
  }
}
