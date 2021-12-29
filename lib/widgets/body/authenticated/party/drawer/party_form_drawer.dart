import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/controllers/bloc/party/new_party/add_party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_bloc/party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_form_toggle/party_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/party/update_party/update_party_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/add_party.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/edit_party.dart';

class PartyFormDrawer extends StatefulWidget {
  const PartyFormDrawer({Key? key}) : super(key: key);

  @override
  State<PartyFormDrawer> createState() => _PartyFormDrawerState();
}

class _PartyFormDrawerState extends State<PartyFormDrawer>
    with TickerProviderStateMixin {
  late Animation<Offset> animation;

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: AnimationDuration.SHORT,
    );
    animation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Container(
        width: ScreenSizeUtil.getBottomDrawerWidth(context),
        height: ScreenSizeUtil.getBottomDrawerHeight(context),
        color: AppColors.blue_1,
        child: BlocBuilder<PartyFormToggleCubit, PartyFormToggleState>(
          builder: (context, state) {
            if (state.toggleForParty is ToggleForPartyUpdate) {
              animationController.forward();
              return BlocProvider<UpdatePartyBloc>(
                create: (context) => serviceLocator<UpdatePartyBloc>()
                  ..subscribe(
                    subscriber: BlocProvider.of<PartyBloc>(context),
                  ),
                child: EditParty(
                  party: (state.toggleForParty as ToggleForPartyUpdate)
                      .partyToBeUpdated,
                  closeDrawer: _cancelUpdate,
                ),
              );
            }
            if (state.toggleForParty is ToggleForNewParty) {
              animationController.forward();
              return BlocProvider<AddPartyBloc>(
                create: (BuildContext context) => serviceLocator<AddPartyBloc>()
                  ..subscribe(
                    subscriber: BlocProvider.of<PartyBloc>(context),
                  ),
                child: AddParty(
                  closeDrawer: _cancelUpdate,
                  party: PartyPresentation.empty(),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  _cancelUpdate() {
    animationController.reverse();
    BlocProvider.of<PartyFormToggleCubit>(context).closeDrawer();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
