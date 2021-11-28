import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';

class AppIconButton extends StatelessWidget {
  final IconData _icon;
  final double _size;
  final Color _color;
  final VoidCallback _onClickHandler;
  final EdgeInsets _padding;

  const AppIconButton._builder(
      this._icon, this._size, this._color, this._onClickHandler, this._padding)
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: _padding,
        child: InkWell(
          hoverColor: AppColors.blue_1,
          onTap: _onClickHandler,
          child: Icon(
            _icon,
            size: _size,
            color: _color,
          ),
        ));
  }
}

class AppIconButtonBuilder {
  late final IconData _icon;
  double? _size;
  Color? _color;
  EdgeInsets? _padding;
  VoidCallback? _onClickHandler;

  AppIconButtonBuilder(this._icon);

  AppIconButtonBuilder size(double size) {
    _size = size;
    return this;
  }

  AppIconButtonBuilder color(Color color) {
    _color = color;
    return this;
  }

  AppIconButtonBuilder padding(EdgeInsets padding) {
    _padding = padding;
    return this;
  }

  AppIconButtonBuilder onClickHandler(VoidCallback onClickHandler) {
    _onClickHandler = onClickHandler;
    return this;
  }

  _onClickHandlerNull() {
    print("Please assign onClick handler for IconButton: ${_icon.toString()}");
  }

  AppIconButton build() {
    return AppIconButton._builder(
        _icon,
        _size ?? 18,
        _color ?? AppColors.black,
        _onClickHandler ?? _onClickHandlerNull,
        _padding ?? const EdgeInsets.all(0));
  }
}
