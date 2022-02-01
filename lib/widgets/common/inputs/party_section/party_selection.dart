import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/controllers/bloc/party/search_party/search_party_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/party_section/party_selection_search.dart';

import '../../../../../../injection_container.dart';

class PartySelectionAndDisplay extends StatelessWidget {
  final Function(PartyPresentation) _onPartySelectCallback;
  final PartyPresentation? _party;
  const PartySelectionAndDisplay(
      {Key? key,
      required Function(PartyPresentation) onPartySelected,
      required PartyPresentation? party})
      : _onPartySelectCallback = onPartySelected,
        _party = party,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_2,
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(maxWidth: 1000),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: BlocProvider(
                create: (context) => serviceLocator<SearchPartyBloc>(),
                child: BlocBuilder<SearchPartyBloc, SearchPartyState>(
                  builder: (context, state) {
                    return PartySelectionSearch(
                        partyList: state.result,
                        onPartySelectCallback: _onPartySelectCallback,
                        party: _party);
                  },
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: _party != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.account_circle,
                                color: AppColors.blue_5,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppTextBuilder(_party!.name)
                                  .color(AppColors.blue_5)
                                  .weight(AppFontWeight.BOLD)
                                  .size(16)
                                  .build()
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.call,
                                color: AppColors.blue_5,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppTextBuilder(_party!.contactNo)
                                  .color(AppColors.green_1)
                                  .weight(AppFontWeight.BOLD)
                                  .size(16)
                                  .build()
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.account_balance_wallet,
                                color: AppColors.blue_5,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppTextBuilder(_party!.balance.toString())
                                  .color(_party!.balance > 0
                                      ? AppColors.green_1
                                      : AppColors.red_2)
                                  .weight(AppFontWeight.BOLD)
                                  .build()
                            ],
                          )
                        ],
                      )
                    : AppTextBuilder("Please select party first")
                        .size(16)
                        .color(AppColors.red_2)
                        .weight(AppFontWeight.BOLD)
                        .build()),
          ],
        ),
      ),
    );
  }

  // void _onPartySelected(PartyPresentation party, BuildContext context) {
  //   BlocProvider.of<AddOrderBloc>(context).add(AddPartyToOrder(party: party));
  // }
}
