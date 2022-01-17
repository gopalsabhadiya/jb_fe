import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';

class AppIconButtonCircle extends StatelessWidget {
  final IconData _icon;
  final double _size;
  final Color _color;
  final Color _backgroundColor;
  final VoidCallback _onClickHandler;
  final EdgeInsets _padding;
  final bool _disabled;

  const AppIconButtonCircle._builder(
    this._icon,
    this._size,
    this._color,
    this._onClickHandler,
    this._padding,
    this._backgroundColor,
    this._disabled,
  ) : super();

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color:
            _disabled ? AppColors.grey_3 : _backgroundColor, //// Button color
        elevation: 5,
        child: InkWell(
          mouseCursor: _disabled
              ? SystemMouseCursors.forbidden
              : SystemMouseCursors.click,
          splashColor: _backgroundColor.withOpacity(0.7), // Splash color
          onTap: _disabled ? null : _onClickHandler,
          child: Padding(
            padding: _padding,
            child: Icon(
              _icon,
              size: _size,
              color: _color,
            ),
          ),
        ),
      ),
    );
  }
}

class AppIconButtonCircleBuilder {
  late final IconData _icon;
  double? _size;
  Color? _color;
  EdgeInsets? _padding;
  VoidCallback? _onClickHandler;
  Color? _backgroundColor;
  bool? _disabled;

  AppIconButtonCircleBuilder(this._icon);

  AppIconButtonCircleBuilder size(double size) {
    _size = size;
    return this;
  }

  AppIconButtonCircleBuilder color(Color color) {
    _color = color;
    return this;
  }

  AppIconButtonCircleBuilder padding(EdgeInsets padding) {
    _padding = padding;
    return this;
  }

  AppIconButtonCircleBuilder onClickHandler(VoidCallback onClickHandler) {
    _onClickHandler = onClickHandler;
    return this;
  }

  AppIconButtonCircleBuilder backgroundColor(Color backgroundColor) {
    _backgroundColor = backgroundColor;
    return this;
  }

  AppIconButtonCircleBuilder disabled(bool disabled) {
    _disabled = disabled;
    return this;
  }

  _onClickHandlerNull() {
    print("Please assign onClick handler for IconButton: ${_icon.toString()}");
  }

  AppIconButtonCircle build() {
    return AppIconButtonCircle._builder(
      _icon,
      _size ?? 22,
      _color ?? AppColors.blue_5,
      _onClickHandler ?? _onClickHandlerNull,
      _padding ?? const EdgeInsets.all(8),
      _backgroundColor ?? AppColors.grey_2,
      _disabled ?? false,
    );
  }
}
