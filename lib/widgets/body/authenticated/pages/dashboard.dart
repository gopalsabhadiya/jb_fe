import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/util/date_util.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/body/subscription_expired/subscription_expired_message.dart';
import 'package:jb_fe/widgets/body/authenticated/dashboard/dashboard.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

import '../../../../controllers/bloc/business/business_data/business_data_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    : const Dashboard();
              case BusinessDataStatus.ERROR:
                return AppTextBuilder("Something went wrong, try again later")
                    .build();
            }
          },
        ),
      ],
    );
  }
}
