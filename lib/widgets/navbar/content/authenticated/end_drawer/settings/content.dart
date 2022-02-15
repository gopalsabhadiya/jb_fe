import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/business/business_data/business_data_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

import 'business_details_section.dart';
import 'item_collection/item_collection_section.dart';
import 'item_extra_section.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.grey_2,
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: BlocBuilder<BusinessDataBloc, BusinessDataState>(
          builder: (context, state) {
            switch (state.status) {
              case BusinessDataStatus.LOADING:
                return const Center(child: CircularProgressIndicator());
              case BusinessDataStatus.COMPLETED:
                return Column(
                  children: [
                    BusinessDetailsSection(business: state.business!),
                    const SizedBox(
                      height: 20,
                    ),
                    ItemCollectionSection(business: state.business!),
                    const SizedBox(
                      height: 20,
                    ),
                    ItemExtraEditSection(business: state.business!),
                  ],
                );
              case BusinessDataStatus.ERROR:
                return AppTextBuilder("Opps Something went wrong").build();
            }
          },
        ),
      ),
    );
  }
}
