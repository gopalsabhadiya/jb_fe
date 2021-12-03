import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class KeyValueDisplay extends StatelessWidget {
  final String _textKey;
  final String _value;
  const KeyValueDisplay({Key? key, required textKey, required value})
      : _textKey = textKey,
        _value = value,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.red1WithOpacity(0.07),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          AppTextBuilder(_textKey).size(16).build(),
          AppTextBuilder(_value)
              .color(AppColors.blue_5)
              .weight(AppFontWeight.BOLD)
              .build()
        ],
      ),
    );
  }
}
