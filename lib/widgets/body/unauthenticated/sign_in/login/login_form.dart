import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/login.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/sign_in.dart';
import 'package:jb_fe/controllers/bloc/authentication.dart';
import 'package:jb_fe/controllers/bloc/events/authentication.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State<LoginForm> {
  bool _obscurePassword = true;
  IconData _suffixPasswordVisible = Icons.visibility;
  LoginFormDTO loginFormDTO = LoginFormDTO();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          AppTextInput(
              onChanged: loginFormDTO.setEmail,
              prefixIcon: Icons.email_outlined,
              hint: SignInText.SIGN_IN_EMAIL_HINT),
          const SizedBox(
            height: 20,
          ),
          AppTextInput(
            onChanged: loginFormDTO.setPassword,
            prefixIcon: Icons.lock_outline,
            hint: SignInText.SIGN_IN_PASSWORD_HINT,
            suffixIcon: _suffixPasswordVisible,
            obscureText: _obscurePassword,
            suffixIconClickHandler: _showHidePassword,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: _getLoginButton(),
            onTap: () {
              _authenticate();
            },
          )
        ],
      ),
    );
  }

  Future<void> _authenticate() async {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(Authenticate(loginFormDTO: loginFormDTO));
  }

  void _showHidePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
      _suffixPasswordVisible =
          _obscurePassword ? Icons.visibility : Icons.visibility_off;
    });
  }

  Widget _getLoginButton() {
    return Container(
      decoration: const ShapeDecoration(
        color: AppColors.blue_5,
        shape: StadiumBorder(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.login,
            color: AppColors.grey_1,
            size: 25,
          ),
          const SizedBox(
            width: 20,
          ),
          AppTextBuilder(SignInText.SIGN_IN)
              .paddingVertical(15)
              .color(AppColors.grey_1)
              .build(),
        ],
      ),
    );
  }
}
