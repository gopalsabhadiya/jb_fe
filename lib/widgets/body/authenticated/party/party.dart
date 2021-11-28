import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/edit_party.dart';
import 'package:jb_fe/widgets/body/authenticated/party/card/party_card.dart';

class Party extends StatefulWidget {
  const Party({Key? key}) : super(key: key);

  @override
  State<Party> createState() => _PartyState();
}

class _PartyState extends State<Party> with TickerProviderStateMixin {
  bool showEditPartyDrawer = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Wrap(
                    clipBehavior: Clip.hardEdge,
                    spacing: 40,
                    runSpacing: 40,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      PartyCard(
                        partyId: "1",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "2",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "3",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "4",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "5",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "6",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "7",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "8",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "9",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "10",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "11",
                        onPartyEdit: _onPartyEdit,
                      ),
                      PartyCard(
                        partyId: "12",
                        onPartyEdit: _onPartyEdit,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // AnimatedContainer(
          //   duration: AnimationDuration.SHORT,
          //   height: play ? MediaQuery.of(context).size.height : 0,
          //   color: AppColors.grey_2,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         color: AppColors.blue_5,
          //         height: 50,
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               AppIconButtonBuilder(Icons.arrow_back)
          //                   .size(25)
          //                   .onClickHandler(_cancelSave)
          //                   .color(AppColors.grey_1)
          //                   .build(),
          //               InkWell(
          //                 onTap: _saveParty,
          //                 child: AppTextBuilder("Save")
          //                     .size(20)
          //                     .weight(AppFontWeight.BOLD)
          //                     .color(AppColors.grey_1)
          //                     .paddingHorizontal(20)
          //                     .build(),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       AppTextBuilder("Hello").build(),
          //     ],
          //   ),
          // )
          AnimatedPositioned(
              width: ScreenSizeUtil.getBottomDrawerWidth(context),
              height: ScreenSizeUtil.getBottomDrawerHeight(context),
              curve: Curves.easeOut,
              duration: AnimationDuration.SHORT,
              top: showEditPartyDrawer ? 0 : MediaQuery.of(context).size.height,
              child: EditParty(
                toggleDrawer: _toggleDrawer,
              ))
          // Container(
          //   color: AppColors.blue_5,
          // )
        ],
      ),
    );
  }

  _toggleDrawer() {
    setState(() {
      showEditPartyDrawer = !showEditPartyDrawer;
    });
  }

  _onPartyEdit(String id) {
    setState(() {
      showEditPartyDrawer = !showEditPartyDrawer;
    });
    print("Edit Party: $id");
  }
}
