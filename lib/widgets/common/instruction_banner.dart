import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class InstructionBanner extends StatelessWidget {
  final VoidCallback _callback;
  final String _instruction;
  const InstructionBanner(
      {Key? key, required VoidCallback callback, required String instruction})
      : _instruction = instruction,
        _callback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: InkWell(
                onTap: _callback,
                child: Container(
                  color: AppColors.blue_1,
                  padding: const EdgeInsets.all(20),
                  child: AppTextBuilder(_instruction)
                      .color(AppColors.red_2)
                      .weight(AppFontWeight.BOLD)
                      .build(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
