import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/texts/sign_in.dart';
import '../../../../../../controllers/bloc/authentication/forgot_password/forgot_password_bloc.dart';
import '../../../../../calligraphy/app_text.dart';
import '../../../../../common/buttons/button.dart';
import '../../../../../common/inputs/text_field.dart';

class SendOTPContent extends StatefulWidget {
  const SendOTPContent({Key? key}) : super(key: key);

  @override
  State<SendOTPContent> createState() => _SendOTPContentState();
}

class _SendOTPContentState extends State<SendOTPContent> {
  late String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextBuilder("Please, enter the email address to get the OTP")
            .color(AppColors.blue_5)
            .size(16)
            .build(),
        const SizedBox(
          height: 30,
        ),
        AppTextInput(
          prefixIcon: Icons.email,
          hint: SignInText.SIGN_IN_EMAIL_HINT,
          onChanged: (String value) => email = value,
        ),
        const SizedBox(
          height: 10,
        ),
        AppButton(
          hint: "Get OTP",
          onClick: () => _sendOTP(context),
          colorScheme: ButtonColorScheme.BLUE,
        ),
      ],
    );
  }

  _sendOTP(BuildContext context) {
    BlocProvider.of<ForgotPasswordBloc>(context).add(
      SendOTPMail(
        email: email,
      ),
    );
  }
}