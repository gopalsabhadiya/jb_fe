import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';

class AppSearchInput extends StatefulWidget {
  final IconData prefixIcon;
  final String hint;
  final bool? obscureText;
  final String? tooltip;
  final Function(String) searchSubmitHandler;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final Function() clearSearchResult;

  const AppSearchInput({
    Key? key,
    required this.prefixIcon,
    required this.hint,
    required this.onChanged,
    this.obscureText,
    this.tooltip,
    required this.searchSubmitHandler,
    required this.clearSearchResult,
    this.validator,
  }) : super(key: key);

  @override
  State<AppSearchInput> createState() => _AppSearchInputState();
}

class _AppSearchInputState extends State<AppSearchInput> {
  IconData suffixIcon = Icons.search;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Tooltip(
          message: widget.tooltip ?? widget.hint,
          textStyle: const TextStyle(fontSize: 14, color: AppColors.blue_1),
          padding: const EdgeInsets.all(5),
          margin: EdgeInsets.all(10),
          triggerMode: TooltipTriggerMode.longPress,
          enableFeedback: true,
          decoration: BoxDecoration(
              color: AppColors.blue5WithOpacity(0.9),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: TextFormField(
            controller: _controller,
            onFieldSubmitted: widget.searchSubmitHandler,
            validator: widget.validator,
            onChanged: (String value) {
              widget.onChanged(value);
              setState(() {
                suffixIcon = Icons.clear;
              });
            },
            obscureText: widget.obscureText ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              isDense: true,
              filled: true,
              fillColor: AppColors.white,
              hoverColor: AppColors.blue_1,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red_2, width: 4),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red_2, width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blue_4, width: 1.5),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blue_5, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              hintStyle: const TextStyle(color: AppColors.grey_3, fontSize: 16),
              errorStyle: const TextStyle(fontSize: 0.001),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Icon(
                  widget.prefixIcon,
                  color: AppColors.blue5WithOpacity(0.7),
                  size: 25,
                ),
              ),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  suffixIcon,
                  color: AppColors.blue_5,
                  size: 25,
                ),
                onPressed: () {
                  _controller.clear();
                  setState(() {
                    suffixIcon = Icons.search;
                  });
                  widget.clearSearchResult();
                },
              ),
              hintText: widget.hint,
            ),
          ),
        ),
      ],
    );
  }
}
