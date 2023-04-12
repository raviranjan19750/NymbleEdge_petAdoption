
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/src/ui/utils/routes.dart';
import 'package:pet_adoption/src/ui/widgets/pet_card.dart';

import '../../../model/pet_data.dart';
import '../../application/homeScreen/petListScreenCubit/pet_list_screen_cubit.dart';

class PetList extends StatelessWidget {
  const PetList({Key? key, this.petDataList}) : super(key: key);

  final List<PetDataItem>? petDataList;
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      key: ValueKey("petListKey"),
      child: ListView.builder(

        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: petDataList?.length??0,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {

                Navigator.of(context)
                    .pushNamed(Routes.petDetailScreen, arguments: {"petDataItem": petDataList![index],
                }
                ).then((id) {
                  if(id != null) {
                    BlocProvider.of<PetListScreenCubit>(context, listen: false)
                        .saveAdoptedPetData(id as int);
                  }
                });
              },
              child: PetCard(petDataItem: petDataList?[index],isAdoptedTab: false,)
          );
        },
      ),
    );
  }
}
