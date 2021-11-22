import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/constants/stream/AuthenticationStatus.dart';
import 'package:jb_fe/constants/enum/navbar_types_enum.dart';
import 'package:jb_fe/controllers/bloc/authentication.dart';
import 'package:jb_fe/controllers/bloc/state/authentication.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/navbar/content/unauthenticated/drawer.dart';

import 'authenticated/drawer.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
      if (state.status == AuthenticationStatus.AUTHENTICATED) {
        return ScreenSizeUtil.getAuthenticatedNavbarType(context) ==
                NavbarTypes.SIDE_HAMBURGER_AUTHENTICATED
            ? AuthenticatedDrawer()
            : const SizedBox.shrink();
      }
      return ScreenSizeUtil.getUnauthenticatedNavbarType(context) ==
              NavbarTypes.SIDE_HAMBURGER_UNAUTHENTICATED
          ? UnauthenticatedDrawer()
          : const SizedBox.shrink();
    });
  }
}
