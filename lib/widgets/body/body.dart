import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/widgets/body/unauthenticated/body.dart';

import '../../controllers/bloc/authentication/login_logout/authentication_bloc.dart';
import 'authenticated/body.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
      if (state.status == AuthenticationStatus.AUTHENTICATED) {
        return const AppBodyAuthenticated();
      }
      return AppBodyUnAuthenticated();
    });
  }
}
