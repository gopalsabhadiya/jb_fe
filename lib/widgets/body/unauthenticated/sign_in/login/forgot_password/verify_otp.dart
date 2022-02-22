import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/texts/defaults.dart';
import '../../../../../../constants/texts/sign_in.dart';
import '../../../../../../controllers/bloc/authentication/forgot_password/forgot_password_bloc.dart';
import '../../../../../calligraphy/app_text.dart';
import '../../../../../common/buttons/button.dart';
import '../../../../../common/inputs/text_field.dart';

class VerifyOTPContent extends StatefulWidget {
  final String? _email;
  final bool? _errorState;
  final String? _otp;
  const VerifyOTPContent({
    Key? key,
    String? email,
    bool? errorState,
    String? otp,
  })  : _email = email,
        _errorState = errorState,
        _otp = otp,
        super(key: key);

  @override
  State<VerifyOTPContent> createState() => _VerifyOTPContentState();
}

class _VerifyOTPContentState extends State<VerifyOTPContent> {
  late String otp;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextBuilder("Please, enter OTP sent to email address:")
            .color(AppColors.blue_5)
            .size(16)
            .build(),
        AppTextBuilder(widget._email!)
            .color(AppColors.green_1)
            .size(16)
            .build(),
        const SizedBox(
          height: 30,
        ),
        AppTextInput(
          prefixIcon: Icons.email,
          hint: SignInText.SIGN_IN_OTP_HINT,
          onChanged: (String value) => otp = value,
          initialValue: widget._otp ?? DefaultTexts.EMPTY,
          errorText: widget._errorState ?? false ? DefaultTexts.EMPTY : null,
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
      VerifyOTP(
        otp: otp,
      ),
    );
  }
}
