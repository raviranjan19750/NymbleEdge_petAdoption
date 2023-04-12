
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/src/application/homeScreen/petListScreenCubit/pet_list_screen_cubit.dart';
import 'package:pet_adoption/src/ui/utils/di_module.dart';
import 'package:pet_adoption/src/ui/utils/local_icons.dart';
import 'package:pet_adoption/src/ui/widgets/pet_card.dart';

import '../../utils/routes.dart';
import '../../widgets/pet_list.dart';

class PetListScreen extends StatelessWidget {
  const PetListScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> getIt<PetListScreenCubit>()..getSharedPrefData(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: WillPopScope(
            onWillPop: () {
              return BlocProvider.of<PetListScreenCubit>(context, listen: false)
                  .onWillPop(context);
            },
            child: BlocBuilder<PetListScreenCubit, PetListScreenState>(

              builder: (context, state) {
                if(state is PetListScreenLoading) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if(state is PetListScreenLoadingSuccessfulState) {
                  return   Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              height: 56,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).dividerColor,
                                  width: 1,
                                ),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    LocalIcons.search,
                                    height: 22,
                                    width: 22,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: TextField(
                                        cursorColor: Colors.black87,
                                        onChanged: (value) {
                                          BlocProvider.of<PetListScreenCubit>(
                                              context,
                                              listen: false)
                                              .searchData(value);
                                        },
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Search pet to adopt",
                                            hintStyle: TextStyle(color: Colors.grey)),
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: PetList(petDataList: state.petDataList,),
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

            )
          ),

        ),
      ),
    );
  }

}
