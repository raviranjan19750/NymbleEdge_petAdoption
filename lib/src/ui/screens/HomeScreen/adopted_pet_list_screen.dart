
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/src/application/homeScreen/adoptedPetListScreenCubit/adopted_pet_list_screen_cubit.dart';

import '../../utils/color_constants.dart';
import '../../utils/di_module.dart';
import '../../utils/routes.dart';
import '../../widgets/empty_state_widget.dart';
import '../../widgets/pet_card.dart';

class AdoptedPetListScreen extends StatelessWidget {
  const AdoptedPetListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocProvider(
      create: (context)=> getIt<AdoptedPetListScreenCubit>()..getSharedPrefData(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<AdoptedPetListScreenCubit, AdoptedPetListScreenState>(

            builder: (context, state) {
              if(state is AdoptedPetListScreenLoading) {
                return const Center(child: CircularProgressIndicator(),);
              }
              else if(state is AdoptedPetListScreenLoadingSuccessfulState) {
                return   Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: state.petDataList?.isNotEmpty == true ? SingleChildScrollView(
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.petDataList?.length??0,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(Routes.petDetailScreen,  arguments: {"petDataItem": state.petDataList![index]});
                                      },
                                      child: PetCard(petDataItem: state.petDataList?[index] ,isAdoptedTab: true,)
                                  );
                                },
                              ),
                            ):EmptyStateWidget(title: "You have not adopted any pet !",),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            },

          ),
        ),
      ),
    );
  }
}
