import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/domain/entities/authentication/login.dart';
import 'package:jb_fe/backend_integration/dto/authentication/login_form_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/sign_in.dart';
import 'package:jb_fe/controllers/bloc/authentication/forgot_password/forgot_password_bloc.dart';
import 'package:jb_fe/widgets/body/unauthenticated/sign_in/login/forgot_password/forgot_password.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/checkbox.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

import '../../../../../controllers/bloc/authentication/login_logout/authentication_bloc.dart';
import '../../../../../injection_container.dart';

class LoginForm extends StatefulWidget {
  final LoginPresentation _loginPresentation;

  const LoginForm({Key? key, required LoginPresentation loginPresentation})
      : _loginPresentation = loginPresentation,
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State<LoginForm> {
  bool _obscurePassword = true;
  IconData _suffixPasswordVisible = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          AppTextInput(
              onChanged: widget._loginPresentation.setEmail,
              prefixIcon: Icons.email_outlined,
              hint: SignInText.SIGN_IN_EMAIL_HINT),
          const SizedBox(
            height: 20,
          ),
          AppTextInput(
            onChanged: widget._loginPresentation.setPassword,
            prefixIcon: Icons.lock_outline,
            hint: SignInText.SIGN_IN_PASSWORD_HINT,
            suffixIcon: _suffixPasswordVisible,
            obscureText: _obscurePassword,
            suffixIconClickHandler: _showHidePassword,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppCheckbox(
                hint: "Remember me?",
                onChanged: (bool value) => print("Remember: $value"),
                scale: 0.8,
                fontSize: 14,
              ),
              RichText(
                text: TextSpan(
                  text: 'Forgot Password?',
                  style: const TextStyle(color: AppColors.blue_4),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _forgotPassword(context),
                ),
              ),
            ],
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
    LoginPresentation loginPresentation = LoginPresentation(
      const LoginEntity(
        email: "gopal.sabhadiya@gmail.com",
        password: "123456",
      ),
    );
    BlocProvider.of<AuthenticationBloc>(context)
        .add(Authenticate(loginPresentation: loginPresentation));
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

  void _forgotPassword(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => serviceLocator<ForgotPasswordBloc>(),
          child: const ForgotPasswordAlert(),
        );
      },
    );
  }
}
