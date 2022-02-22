import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/texts/defaults.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/texts/sign_in.dart';
import '../../../../../../controllers/bloc/authentication/forgot_password/forgot_password_bloc.dart';
import '../../../../../calligraphy/app_text.dart';
import '../../../../../common/buttons/button.dart';
import '../../../../../common/inputs/text_field.dart';

class ChangePasswordContent extends StatefulWidget {
  const ChangePasswordContent({Key? key}) : super(key: key);

  @override
  State<ChangePasswordContent> createState() => _ChangePasswordContentState();
}

class _ChangePasswordContentState extends State<ChangePasswordContent> {
  late String password;
  late String confirmPassword;
  late bool _obscurePassword;
  late IconData _suffixPasswordVisible;

  @override
  void initState() {
    password = DefaultTexts.EMPTY;
    confirmPassword = DefaultTexts.EMPTY;
    _obscurePassword = true;
    _suffixPasswordVisible = Icons.visibility;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextBuilder("Please, enter new password.")
            .color(AppColors.blue_5)
            .size(16)
            .build(),
        const SizedBox(
          height: 30,
        ),
        AppTextInput(
          initialValue: password,
          obscureText: _obscurePassword,
          prefixIcon: Icons.lock_outline,
          hint: SignInText.SIGN_IN_NEW_PASSWORD_HINT,
          onChanged: (String value) => password = value,
          suffixIcon: _suffixPasswordVisible,
          suffixIconClickHandler: _showHidePassword,
        ),
        const SizedBox(
          height: 10,
        ),
        AppTextInput(
          initialValue: confirmPassword,
          obscureText: _obscurePassword,
          prefixIcon: Icons.lock_outline,
          hint: SignInText.SIGN_IN_NEW_PASSWORD_HINT,
          onChanged: (String value) => confirmPassword = value,
          suffixIcon: _suffixPasswordVisible,
          suffixIconClickHandler: _showHidePassword,
        ),
        const SizedBox(
          height: 10,
        ),
        AppButton(
          hint: "Submit",
          onClick: () => _sendOTP(context),
          colorScheme: ButtonColorScheme.BLUE,
        ),
      ],
    );
  }

  _sendOTP(BuildContext context) {
    BlocProvider.of<ForgotPasswordBloc>(context).add(
      ChangePassword(
        password: password,
      ),
    );
  }

  void _showHidePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
      _suffixPasswordVisible =
          _obscurePassword ? Icons.visibility : Icons.visibility_off;
    });
  }
}
