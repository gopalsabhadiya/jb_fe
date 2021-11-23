import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';

class AppTextInput extends StatelessWidget {
  final IconData prefixIcon;
  final String hint;
  final IconData? suffixIcon;
  final IconData? alternateSuffixIcon;
  final bool? obscureText;
  final VoidCallback? suffixIconClickHandler;
  final Function(String) onChanged;
  const AppTextInput(
      {Key? key,
      required this.prefixIcon,
      required this.hint,
      required this.onChanged,
      this.suffixIcon,
      this.obscureText,
      this.suffixIconClickHandler,
      this.alternateSuffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hoverColor: AppColors.blue_1,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red_2, width: 1.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue_4, width: 1.5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue_5, width: 1.5),
            ),
            hintStyle: const TextStyle(color: AppColors.grey_3, fontSize: 16),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                prefixIcon,
                color: AppColors.blue_5,
                size: 35,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                icon: Icon(
                  suffixIcon,
                  color: AppColors.blue_5,
                  size: 30,
                ),
                onPressed: () {
                  suffixIconClickHandler!();
                },
              ),
            ),
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
