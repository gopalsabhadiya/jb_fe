import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';

class AppSearchBarInput extends StatelessWidget {
  final String hint;
  final IconData? suffixIcon;
  final bool? obscureText;
  final VoidCallback suffixIconClickHandler;
  final Function(String) onChanged;
  const AppSearchBarInput({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.suffixIcon,
    this.obscureText,
    required this.suffixIconClickHandler,
  }) : super(key: key);

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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: AppColors.red_2, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: AppColors.blue_4, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: AppColors.blue_5, width: 1.5),
            ),
            hintStyle: const TextStyle(color: AppColors.grey_3, fontSize: 16),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: AppColors.blue_5,
                size: 25,
              ),
              onPressed: () {
                suffixIconClickHandler();
              },
            ),
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
