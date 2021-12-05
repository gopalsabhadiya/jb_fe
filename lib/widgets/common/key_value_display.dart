import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class KeyValueDisplay extends StatelessWidget {
  final String? _textKey;
  final IconData? _iconKey;
  final String _value;
  final Color? _keyColor;
  final Color? _valueColor;
  final Color? _backgroundColor;
  const KeyValueDisplay(
      {Key? key,
      required value,
      textKey,
      iconKey,
      keyColor = AppColors.blue_5,
      valueColor = AppColors.blue_5,
      backgroundColor = AppColors.blue_5})
      : assert(textKey != null || iconKey != null),
        _textKey = textKey,
        _iconKey = iconKey,
        _value = value,
        _keyColor = keyColor,
        _valueColor = valueColor,
        _backgroundColor = backgroundColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: _backgroundColor!.withOpacity(0.07),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          _textKey != null
              ? AppTextBuilder(_textKey!).color(_keyColor!).size(16).build()
              : Icon(
                  _iconKey,
                  color: _keyColor,
                  size: 30,
                ),
          AppTextBuilder(_value)
              .color(_valueColor!)
              .weight(AppFontWeight.BOLD)
              .build()
        ],
      ),
    );
  }
}
