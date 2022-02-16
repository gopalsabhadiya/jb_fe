import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/business/business_data/business_data_bloc.dart';
import 'package:jb_fe/controllers/bloc/business/update_business/update_business_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

import 'business_details_section.dart';
import 'item_collection/item_collection_section.dart';
import 'item_extra_section.dart';

class SettingsContent extends StatelessWidget {
  final VoidCallback _closeDrawer;
  const SettingsContent({Key? key, required VoidCallback closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.grey_2,
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: BlocBuilder<BusinessDataBloc, BusinessDataState>(
          builder: (BuildContext context, BusinessDataState businessDataState) {
            return BlocConsumer<UpdateBusinessBloc, UpdateBusinessState>(
              listener: (BuildContext context,
                  UpdateBusinessState updateBusinessState) {
                print(
                    "Listener called-------------------------------------------${updateBusinessState.status}");
                if (updateBusinessState.status ==
                    UpdateBusinessStatus.COMPLETED) {
                  _closeDrawer();
                }
              },
              builder: (BuildContext context,
                  UpdateBusinessState updateBusinessState) {
                if (businessDataState.status == BusinessDataStatus.LOADING ||
                    updateBusinessState.status ==
                        UpdateBusinessStatus.LOADING) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (businessDataState.status == BusinessDataStatus.ERROR ||
                    updateBusinessState.status == UpdateBusinessStatus.ERROR) {
                  return AppTextBuilder("Opps Something went wrong").build();
                }

                return Column(
                  children: [
                    BusinessDetailsSection(
                        business: businessDataState.business!),
                    const SizedBox(
                      height: 20,
                    ),
                    ItemCollectionSection(
                        business: businessDataState.business!),
                    const SizedBox(
                      height: 20,
                    ),
                    ItemExtraEditSection(business: businessDataState.business!),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
