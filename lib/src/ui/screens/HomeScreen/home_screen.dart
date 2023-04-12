import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption/src/application/homeScreen/homeScreenCubit/home_screen_cubit.dart';

import 'package:pet_adoption/src/ui/screens/HomeScreen/pet_list_screen.dart';
import 'package:pet_adoption/src/ui/utils/color_constants.dart';
import 'package:pet_adoption/src/ui/utils/di_module.dart';
import 'package:pet_adoption/src/ui/widgets/exit_pop_up.dart';

import '../../utils/local_icons.dart';
import 'adopted_pet_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeScreenCubit>(),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstants.greenMatte,
            body: WillPopScope(
              onWillPop:() async {
                if (Platform.isAndroid) {
                  showExitPopUp(context);
                }
                return false;
              },
              child: DefaultTabController(
                  initialIndex: 0,
                  length: 2,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, value) {
                      return[
                        SliverAppBar(
                          floating: true,
                            pinned: false,
                            snap: false,
                            elevation: 0,
                            flexibleSpace: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned.fill(child: Lottie.asset(LocalIcons.lottieHappyDogAnimation, repeat: true, fit: BoxFit.scaleDown),),


                              ],
                            ),

                          backgroundColor: ColorConstants.greenMatte,
                          expandedHeight:150,
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                              [

                              ]
                            ),
                          ),
                        )
                      ];
                    },
                    body:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          color: ColorConstants.greenMatte,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              const SizedBox(
                                height: 8,
                              ),

                              const SizedBox(
                                height: 16,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(


                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.12),
                                        blurRadius: 12.0, // soften the shadow
                                        spreadRadius: 8.0, //extend the shadow
                                        offset: const Offset(
                                          14.0, // Move to right 5  horizontally
                                          14.0, // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ],
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(32.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(32.0),
                                        bottomLeft: Radius.circular(32.0)),
                                  ),
                                  child:   TabBar(
                                    indicatorColor: Theme.of(context).indicatorColor,
                                    padding: EdgeInsets.zero,
                                    indicatorPadding: EdgeInsets.zero,
                                    labelPadding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 0),
                                    isScrollable: true,
                                    unselectedLabelColor: Colors.black45,
                                    indicatorWeight: 1,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    labelColor: ColorConstants.greenMatte,
                                    unselectedLabelStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.grey),
                                    labelStyle:
                                    const TextStyle(fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                    tabs: const [
                                      Tab(
                                        text: "Pet list",
                                      ),
                                      Tab(
                                        text: "Adopted pet list",
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),


                        Expanded(child: Container(

                          decoration:  BoxDecoration(
                            color: Theme.of(context).backgroundColor,

                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(32.0),
                                bottomLeft: Radius.circular(0.0)),
                          ),
                          child: TabBarView(
                            children: [

                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 24),
                                  child: const PetListScreen()),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 24),
                                  child: const AdoptedPetListScreen())

                            ],
                          ),
                        ))
                      ],
                    ),

                  )
              ),
            )
        ),
      ),
    );
  }
  Future<void> showExitPopUp(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return const ExitPopUp();
      },
    );
  }
}
