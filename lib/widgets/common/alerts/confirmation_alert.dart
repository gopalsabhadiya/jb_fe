import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class ConfirmationAlert extends StatelessWidget {
  final String _title;
  final String _content;
  final String _variable;
  final VoidCallback _continueCallBack;

  const ConfirmationAlert(
      {Key? key,
      required title,
      required content,
      required continueCallBack,
      required variable})
      : _title = title,
        _content = content,
        _variable = variable,
        _continueCallBack = continueCallBack,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        title: AppTextBuilder(_title)
            .color(AppColors.red_2)
            .size(22)
            .weight(AppFontWeight.BOLD)
            .textAlign(TextAlign.start)
            .build(),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextBuilder(_content)
                .color(AppColors.black)
                .size(16)
                .textAlign(TextAlign.start)
                .build(),
            AppTextBuilder(_variable)
                .color(AppColors.green_1)
                .weight(AppFontWeight.BOLD)
                .size(16)
                .textAlign(TextAlign.start)
                .build(),
          ],
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
            child: AppTextBuilder(DefaultTexts.AGREE)
                .color(AppColors.red_2)
                .size(16)
                .build(),
            onPressed: _continueCallBack,
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return AppColors.blue4WithOpacity(0.04);
                    ;
                  }
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed)) {
                    return AppColors.blue4WithOpacity(0.04);
                    ;
                  }
                  return null; // Defer to the widget's default.
                },
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              foregroundColor:
                  MaterialStateProperty.all<Color>(AppColors.blue_5),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: AppColors.blue_5, width: 2),
                ),
              ),
            ),
            child: AppTextBuilder(DefaultTexts.DISAGREE)
                .color(AppColors.blue_5)
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
