import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';

class AppIconButton extends StatelessWidget {
  final IconData _icon;
  final double _size;
  final Color _color;
  final VoidCallback _onClickHandler;
  final EdgeInsets _padding;
  final FocusNode? _focusNode;
  final bool _disabled;

  const AppIconButton._builder(this._icon, this._size, this._color,
      this._onClickHandler, this._padding, this._focusNode, this._disabled)
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: _padding,
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          focusNode: _focusNode,
          disabledColor: AppColors.grey_2,
          color: AppColors.blue_5,
          // hoverColor: AppColors.blue_1,
          onPressed: _disabled ? null : _onClickHandler,
          icon: Icon(
            _icon,
            size: _size,
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
  FocusNode? _focusNode;
  bool? _disabled;

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

  AppIconButtonBuilder addFocusNode(FocusNode focusNode) {
    print("Focus node added");
    _focusNode = focusNode;
    return this;
  }

  AppIconButtonBuilder isDisabled(bool disabled) {
    _disabled = disabled;
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
      _padding ?? const EdgeInsets.all(0),
      _focusNode,
      _disabled ?? false,
    );
  }
}
