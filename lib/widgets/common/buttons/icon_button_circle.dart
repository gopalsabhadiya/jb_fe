import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';

class AppIconButtonCircle extends StatelessWidget {
  final IconData _icon;
  final double _size;
  final Color _color;
  final VoidCallback _onClickHandler;
  final EdgeInsets _padding;

  const AppIconButtonCircle._builder(
      this._icon, this._size, this._color, this._onClickHandler, this._padding)
      : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onClickHandler,
      child: Icon(
        _icon,
        size: 25,
        color: AppColors.blue_5,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(15),
        primary: AppColors.grey_2, // <-- Button color
        onPrimary: AppColors.blue_2, // <-- Splash color
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

  _onClickHandlerNull() {
    print("Please assign onClick handler for IconButton: ${_icon.toString()}");
  }

  AppIconButtonCircle build() {
    return AppIconButtonCircle._builder(
        _icon,
        _size ?? 18,
        _color ?? AppColors.black,
        _onClickHandler ?? _onClickHandlerNull,
        _padding ?? const EdgeInsets.all(0));
  }
}
