import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/controllers/bloc/party/delete_party/delete_party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_bloc/party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_form_toggle/party_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/party/update_party/update_party_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/edit_party.dart';
import 'package:jb_fe/widgets/body/authenticated/party/card/party_card.dart';
import 'package:jb_fe/widgets/body/authenticated/party/drawer/party_form_drawer.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class Party extends StatefulWidget {
  const Party({Key? key}) : super(key: key);

  @override
  State<Party> createState() => _PartyState();
}

class _PartyState extends State<Party> with TickerProviderStateMixin {
  late ScrollController _controller;
  late Animation<Offset> animation;
  late AnimationController animationController;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_onScroll);

    animationController =
        AnimationController(vsync: this, duration: AnimationDuration.SHORT);
    animation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -1))
            .animate(animationController);

    super.initState();
  }

  bool showEditPartyDrawer = false;
  PartyPresentation? editParty;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdatePartyBloc>(
      create: (BuildContext context) => serviceLocator<UpdatePartyBloc>()
        ..subscribe(
          subscriber: BlocProvider.of<PartyBloc>(context),
        ),
      child: Expanded(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: BlocBuilder<PartyBloc, PartyState>(
                      builder: (BuildContext context, PartyState state) {
                        switch (state.status) {
                          case PartyStatus.INITIAL:
                            return const Center(
                                child: CircularProgressIndicator());
                          case PartyStatus.LOADING:
                            _controller
                                .jumpTo(_controller.position.minScrollExtent);
                            return const Center(
                                child: CircularProgressIndicator());
                          case PartyStatus.SUCCESS:
                            return BlocProvider<DeletePartyBloc>(
                              create: (context) =>
                                  serviceLocator<DeletePartyBloc>()
                                    ..subscribe(
                                      subscriber:
                                          BlocProvider.of<PartyBloc>(context),
                                    ),
                              child: Wrap(
                                clipBehavior: Clip.hardEdge,
                                spacing: 40,
                                runSpacing: 40,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                children: _getParties(state.partyList, context),
                              ),
                            );
                          case PartyStatus.FAILURE:
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
            const PartyFormDrawer()
          ],
        ),
      ),
    );
  }

  _onPartyEdit(PartyPresentation party, BuildContext context) {
    BlocProvider.of<UpdatePartyBloc>(context)
        .add(AddPartyToBeUpdated(partyToBeUpdated: party));
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
      context.read<PartyBloc>().add(FetchNextPartyPage());
    }
  }

  bool get _isBottom {
    if (!_controller.hasClients) return false;
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  List<Widget> _getParties(
      List<PartyPresentation> partyList, BuildContext context) {
    return partyList
        .map(
          (party) => PartyCard(
            party: party,
            onPartyEdit: (party) => _onPartyEdit(party, context),
          ),
        )
        .toList();
  }
}
