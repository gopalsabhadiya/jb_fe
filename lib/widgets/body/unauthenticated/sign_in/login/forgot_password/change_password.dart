import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          prefixIcon: Icons.email,
          hint: SignInText.SIGN_IN_NEW_PASSWORD_HINT,
          onChanged: (String value) => password = value,
        ),
        const SizedBox(
          height: 10,
        ),
        AppTextInput(
          prefixIcon: Icons.email,
          hint: SignInText.SIGN_IN_NEW_PASSWORD_HINT,
          onChanged: (String value) => password = value,
        ),
        const SizedBox(
          height: 10,
        ),
        AppButton(
          hint: "Submit OTP",
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
}
