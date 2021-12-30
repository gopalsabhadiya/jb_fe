import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/party/delete_party/delete_party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_bloc/party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_form_toggle/party_form_toggle_cubit.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/body/authenticated/party/card/party_card.dart';
import 'package:jb_fe/widgets/body/authenticated/party/drawer/party_form_drawer.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class Party extends StatefulWidget {
  const Party({Key? key}) : super(key: key);

  @override
  State<Party> createState() => _PartyState();
}

class _PartyState extends State<Party> with TickerProviderStateMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

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
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: BlocBuilder<PartyBloc, PartyState>(
                    builder: (BuildContext context, PartyState state) {
                      print("Into buildeer");
                      switch (state.status) {
                        case PartyStatus.INITIAL:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case PartyStatus.LOADING:
                          _scrollController.jumpTo(
                              _scrollController.position.minScrollExtent);
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case PartyStatus.SUCCESS:
                          return BlocProvider<DeletePartyBloc>(
                            create: (BuildContext context) =>
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
                              children: _getParties(state.partyList),
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
    );
  }

  _onPartyEdit(PartyPresentation party) {
    BlocProvider.of<PartyFormToggleCubit>(context).openDrawer(
      toggleForParty: ToggleForPartyUpdate(partyToBeUpdated: party),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && _scrollController.position.extentAfter == 0) {
      BlocProvider.of<PartyBloc>(context).add(FetchNextPartyPage());
      // context.read<PartyBloc>().add(FetchNextPartyPage());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  List<Widget> _getParties(List<PartyPresentation> partyList) {
    return partyList
        .map(
          (party) => PartyCard(
            party: party,
            onPartyEdit: (party) => _onPartyEdit(party),
          ),
        )
        .toList();
  }
}
