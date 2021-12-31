import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jb_fe/backend_integration/constants/other/regex.dart';
import 'package:jb_fe/constants/colors.dart';

class AppTextInput extends StatelessWidget {
  final IconData prefixIcon;
  final String hint;
  final String? initialValue;
  final IconData? suffixIcon;
  final IconData? alternateSuffixIcon;
  final bool? obscureText;
  final bool isNumberInput;
  final String? tooltip;
  final VoidCallback? suffixIconClickHandler;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  const AppTextInput({
    Key? key,
    required this.prefixIcon,
    required this.hint,
    required this.onChanged,
    this.initialValue,
    this.suffixIcon,
    this.obscureText,
    this.isNumberInput = false,
    this.tooltip,
    this.suffixIconClickHandler,
    this.alternateSuffixIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Tooltip(
          key: key,
          message: tooltip ?? hint,
          textStyle: const TextStyle(fontSize: 14, color: AppColors.blue_1),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          triggerMode: TooltipTriggerMode.longPress,
          enableFeedback: true,
          decoration: BoxDecoration(
              color: AppColors.blue5WithOpacity(0.9),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: TextFormField(
            keyboardType:
                isNumberInput ? TextInputType.number : TextInputType.text,
            inputFormatters: isNumberInput
                ? [
                    FilteringTextInputFormatter(RegexConstants.NUMBER_REGEX,
                        allow: true)
                  ]
                : [],
            validator: validator,
            controller: TextEditingController()..text = initialValue ?? "",
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              hoverColor: AppColors.blue_1,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red_2, width: 4),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red_2, width: 1.5),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blue_4, width: 1.5),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blue_5, width: 1.5),
              ),
              hintStyle: const TextStyle(color: AppColors.grey_3, fontSize: 16),
              errorStyle: const TextStyle(fontSize: 0.001),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  prefixIcon,
                  color: AppColors.blue5WithOpacity(0.7),
                  size: 25,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  suffixIcon,
                  color: AppColors.blue_5,
                  size: 25,
                ),
                onPressed: () {
                  suffixIconClickHandler!();
                },
              ),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}
