import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/widgets/body/unauthenticated/sign_in/login/forgot_password/send_otp.dart';
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
        content: const SendOTPContent(),
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
            child: AppTextBuilder(DefaultTexts.CANCEL)
                .color(AppColors.red_2)
                .size(16)
                .build(),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
