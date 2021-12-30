import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_bloc/party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_form_toggle/party_form_toggle_cubit.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/party/party.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

import '../../../../injection_container.dart';

class PartyPage extends StatelessWidget {
  const PartyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PartyBloc>(
          create: (BuildContext context) => serviceLocator<PartyBloc>()
            ..add(
              FetchPartyFirstPage(),
            ),
        ),
        BlocProvider<PartyFormToggleCubit>(
          create: (BuildContext context) =>
              serviceLocator<PartyFormToggleCubit>(),
        )
      ],
      child: Column(
        children: [
          ScreenSizeUtil.getIsHamburgerNavbar(context)
              ? const HamburgerTopAuthenticatedNavbar()
              : const RegularTopAuthenticatedNavbar(),
          const Party(),
        ],
      ),
    );
  }
}
