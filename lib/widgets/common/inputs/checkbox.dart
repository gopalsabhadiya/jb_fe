import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class AppCheckbox extends StatefulWidget {
  final String hint;
  final bool? obscureText;
  final Function(bool) onChanged;
  final String? tooltip;
  final bool initialValue;

  const AppCheckbox({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.obscureText,
    this.initialValue = false,
    this.tooltip,
  }) : super(key: key);

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  late bool checkboxValue;

  @override
  void initState() {
    checkboxValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      key: GlobalKey<State<Tooltip>>(),
      message: widget.tooltip ?? widget.hint,
      textStyle: const TextStyle(fontSize: 14, color: AppColors.blue_1),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      triggerMode: TooltipTriggerMode.longPress,
      enableFeedback: true,
      decoration: BoxDecoration(
        color: AppColors.blue5WithOpacity(0.9),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
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
      ),
    );
  }

  void _checkboxValueChanged(bool? newValue) {
    setState(() {
      checkboxValue = newValue ?? false;
    });
    widget.onChanged(newValue ?? false);
  }
}
