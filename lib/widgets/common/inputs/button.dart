import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

enum ButtonColorScheme { RED, BLUE }

class AppButton extends StatelessWidget {
  final ButtonColorScheme _colorScheme;
  final String _hint;
  final VoidCallback _onClick;
  final IconData? _icon;
  const AppButton(
      {Key? key, required hint, icon, required onClick, required colorScheme})
      : _hint = hint,
        _icon = icon,
        _onClick = onClick,
        _colorScheme = colorScheme,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        children: _getContent(),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return _getHoverColor();
            }
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return _getClickColor();
            }
            return null; // Defer to the widget's default.
          },
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(_getColor()),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: _getColor(), width: 2),
          ),
        ),
      ),
      onPressed: _onClick,
    );
  }

  List<Widget> _getContent() {
    List<Widget> content = [];
    if (_icon != null) {
      content.addAll([
        Icon(_icon),
        const SizedBox(
          width: 10,
        )
      ]);
    }
    content.add(AppTextBuilder(_hint)
        .size(16)
        .color(_getColor())
        .weight(AppFontWeight.BOLD)
        .build());
    return content;
  }

  Color _getColor() {
    switch (_colorScheme) {
      case ButtonColorScheme.RED:
        return AppColors.red_2;
      case ButtonColorScheme.BLUE:
        return AppColors.blue_5;
    }
  }

  Color _getHoverColor() {
    switch (_colorScheme) {
      case ButtonColorScheme.RED:
        return AppColors.red2WithOpacity(0.04);
      case ButtonColorScheme.BLUE:
        return AppColors.blue4WithOpacity(0.04);
    }
  }

  Color _getClickColor() {
    switch (_colorScheme) {
      case ButtonColorScheme.RED:
        return AppColors.red2WithOpacity(0.12);
      case ButtonColorScheme.BLUE:
        return AppColors.blue4WithOpacity(0.12);
    }
  }
}
