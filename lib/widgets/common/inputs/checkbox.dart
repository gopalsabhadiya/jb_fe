import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class AppCheckbox extends StatefulWidget {
  final String hint;
  final bool? obscureText;
  final Function(bool) onChanged;
  const AppCheckbox({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.obscureText,
  }) : super(key: key);

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Theme(
          data: ThemeData(unselectedWidgetColor: AppColors.blue_5),
          child: Checkbox(
            value: checkboxValue,
            onChanged: _checkboxValueChanged,
            activeColor: AppColors.blue_5,
          ),
        ),
        AppTextBuilder(widget.hint)
            .color(AppColors.blue_5)
            .weight(AppFontWeight.BOLD)
            .paddingHorizontal(5)
            .build()
      ],
    );
  }

  void _checkboxValueChanged(bool? newValue) {
    setState(() {
      checkboxValue = newValue ?? false;
    });
    widget.onChanged(newValue ?? false);
  }
}
