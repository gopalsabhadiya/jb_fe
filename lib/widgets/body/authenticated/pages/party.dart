import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_bloc/party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_form_toggle/party_form_toggle_cubit.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/party/party.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

import '../../../../controllers/bloc/business/business_data/business_data_bloc.dart';
import '../../../../injection_container.dart';
import '../../../../util/date_util.dart';
import '../../../calligraphy/app_text.dart';
import '../body/subscription_expired/subscription_expired_message.dart';

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
          BlocBuilder<BusinessDataBloc, BusinessDataState>(
            builder: (BuildContext context, BusinessDataState state) {
              switch (state.status) {
                case BusinessDataStatus.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case BusinessDataStatus.COMPLETED:
                  return DateUtil.pastDate(state.business!.subscriptionEnd)
                      ? const SubscriptionExpiredMessage()
                      : const Party();
                case BusinessDataStatus.ERROR:
                  return AppTextBuilder("Something went wrong, try again later")
                      .build();
              }
            },
          ),
        ],
      ),
    );
  }
}
