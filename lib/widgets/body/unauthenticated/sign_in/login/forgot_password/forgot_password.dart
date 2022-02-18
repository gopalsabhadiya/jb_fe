import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/authentication/forgot_password/forgot_password_bloc.dart';
import 'package:jb_fe/widgets/body/unauthenticated/sign_in/login/forgot_password/change_password.dart';
import 'package:jb_fe/widgets/body/unauthenticated/sign_in/login/forgot_password/send_otp.dart';
import 'package:jb_fe/widgets/body/unauthenticated/sign_in/login/forgot_password/verify_otp.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/texts/defaults.dart';
import '../../../../../../constants/typography/font_weight.dart';

class ForgotPasswordAlert extends StatelessWidget {
  const ForgotPasswordAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        title: AppTextBuilder("Forgot your password")
            .color(AppColors.blue_5)
            .size(28)
            .weight(AppFontWeight.BOLD)
            .textAlign(TextAlign.start)
            .build(),
        content: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          builder: (context, state) {
            switch (state.status) {
              case ForgotPasswordStatus.INITIATED:
                return const SendOTPContent();
              case ForgotPasswordStatus.FAILED_TO_SEND_OTP:
                return SendOTPContent(
                  email: state.email,
                  errorState: true,
                );
              case ForgotPasswordStatus.LOADING:
                return AppTextBuilder("Dummy").build();
              case ForgotPasswordStatus.COMPLETED:
                return AppTextBuilder("Password Changed Successfully")
                    .color(AppColors.green_1)
                    .size(22)
                    .build();
              case ForgotPasswordStatus.VERIFY_OTP:
                return VerifyOTPContent(email: state.email);
              case ForgotPasswordStatus.CHANGE_PASSWORD:
                return const ChangePasswordContent();
              case ForgotPasswordStatus.ERROR:
                return const SendOTPContent();
            }
          },
        ),
        actions: <Widget>[
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return AppColors.red2WithOpacity(0.04);
                    ;
                  }
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed)) {
                    return AppColors.red2WithOpacity(0.04);
                    ;
                  }
                  return null; // Defer to the widget's default.
                },
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              foregroundColor:
                  MaterialStateProperty.all<Color>(AppColors.red_2),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: AppColors.red_2, width: 2),
                ),
              ),
            ),
            child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
              builder: (context, state) {
                if (state.status == ForgotPasswordStatus.COMPLETED) {
                  return AppTextBuilder(DefaultTexts.OK)
                      .color(AppColors.blue_5)
                      .size(16)
                      .build();
                }
                return AppTextBuilder(DefaultTexts.CANCEL)
                    .color(AppColors.red_2)
                    .size(16)
                    .build();
              },
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
