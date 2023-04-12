
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/src/application/splashScreen/splash_cubit.dart';
import 'package:pet_adoption/src/ui/utils/di_module.dart';

import '../utils/color_constants.dart';
import '../utils/local_icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> getIt<SplashCubit>(),
      child: Scaffold(

        backgroundColor: ColorConstants.greenMatte,
        body: BlocBuilder<SplashCubit,SplashState>(
          builder: (context, state) {
            context.watch<SplashCubit>().getSharedPrefData(context);
            return Container(
              width: double.maxFinite,
              color: ColorConstants.greenMatte,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    LocalIcons.paw,
                    height: 100,
                    width: 100,
                    color: Colors.white,
                  ),

                   SizedBox(height: 56,),

                   Text(
                    "Adopt a PET",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
