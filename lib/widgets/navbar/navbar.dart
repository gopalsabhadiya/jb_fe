import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/constants/stream/AuthenticationStatus.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/authentication.dart';
import 'package:jb_fe/controllers/bloc/state/authentication.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/navbar/content/navbar_content.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (BuildContext context, AuthenticationState state) {
              if (state.status == AuthenticationStatus.AUTHENTICATED) {
                return NavbarContent(
                    navbarType:
                        ScreenSizeUtil.getAuthenticatedNavbarType(context));
              }
              return NavbarContent(
                navbarType:
                    ScreenSizeUtil.getUnauthenticatedNavbarType(context),
              );
            }),
          ),
        ],
      ),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: AppColors.grey_3.withOpacity(0.5),
            blurRadius: 10.0,
            offset: const Offset(10, 0))
      ], color: AppColors.white),
    );
  }
}
