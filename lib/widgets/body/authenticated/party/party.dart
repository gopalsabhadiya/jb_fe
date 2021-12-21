import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/controllers/delete_party/delete_party_bloc.dart';
import 'package:jb_fe/controllers/party_bloc/party_bloc.dart';
import 'package:jb_fe/controllers/update_party/update_party_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/edit_party.dart';
import 'package:jb_fe/widgets/body/authenticated/party/card/party_card.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class Party extends StatefulWidget {
  const Party({Key? key}) : super(key: key);

  @override
  State<Party> createState() => _PartyState();
}

class _PartyState extends State<Party> with TickerProviderStateMixin {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_onScroll);

    super.initState();
  }

  bool showEditPartyDrawer = false;
  PartyPresentation? editParty;
  @override
  Widget build(BuildContext context) {
    final DeletePartyBloc deletePartyBloc = serviceLocator<DeletePartyBloc>();
    deletePartyBloc.stream.listen(
      (event) {
        if (event.deleteStatus == DeletePartyStatus.COMPLETED) {
          BlocProvider.of<PartyBloc>(context)
              .add(RemoveParty(partyId: event.lastDeletedPartyId!));
        }
      },
    );
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
                  controller: _controller,
                  child: BlocBuilder<PartyBloc, PartyState>(
                    builder: (BuildContext context, PartyState state) {
                      switch (state.status) {
                        case PartyStatus.initial:
                          return const Center(
                              child: CircularProgressIndicator());
                        case PartyStatus.success:
                          return BlocProvider<DeletePartyBloc>(
                            create: (context) => deletePartyBloc,
                            child: Wrap(
                              clipBehavior: Clip.hardEdge,
                              spacing: 40,
                              runSpacing: 40,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.center,
                              children: _getParties(state.partyList),
                            ),
                          );
                        case PartyStatus.failure:
                          return Center(
                            child: AppTextBuilder("Failed to fetch parties")
                                .build(),
                          );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            width: ScreenSizeUtil.getBottomDrawerWidth(context),
            height: ScreenSizeUtil.getBottomDrawerHeight(context),
            curve: Curves.easeOut,
            duration: AnimationDuration.SHORT,
            top: showEditPartyDrawer ? 0 : MediaQuery.of(context).size.height,
            child: editParty != null
                ? BlocProvider<UpdatePartyBloc>(
                    create: (BuildContext context) =>
                        serviceLocator<UpdatePartyBloc>(),
                    child: EditParty(
                      party: editParty!,
                      toggleDrawer: _toggleDrawer,
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  _toggleDrawer() {
    setState(() {
      showEditPartyDrawer = !showEditPartyDrawer;
    });
  }

  _onPartyEdit(PartyPresentation party) {
    setState(() {
      showEditPartyDrawer = !showEditPartyDrawer;
      editParty = party;
    });
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && _controller.position.extentAfter == 0) {
      context.read<PartyBloc>().add(FetchParties());
    }
  }

  bool get _isBottom {
    if (!_controller.hasClients) return false;
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  List<Widget> _getParties(List<PartyPresentation> partyList) {
    return partyList
        .map(
          (party) => PartyCard(
            party: party,
            onPartyEdit: _onPartyEdit,
          ),
        )
        .toList();
  }
}
