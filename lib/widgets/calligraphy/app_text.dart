import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';

class AppText extends StatelessWidget {
  final String _text;
  final Color _color;
  final double _size;
  final double _opacity;
  final FontWeight _weight;
  final EdgeInsets _padding;
  final TextAlign _textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Text(
        _text,
        style: TextStyle(
          color: _color.withOpacity(_opacity),
          fontSize: _size,
          fontWeight: _weight,
        ),
        textAlign: _textAlign,
      ),
    );
  }

  AppText._builder(this._text, this._color, this._size, this._opacity,
      this._weight, this._padding, this._textAlign)
      : super(key: ValueKey<String>(_text));
}

class AppTextBuilder {
  final String _text;
  late Color _textColor = AppColors.black;
  late double _fontSize = 18;
  late double _textOpacity = 1;
  late FontWeight _fontWeight = FontWeight.normal;
  late EdgeInsets _padding = EdgeInsets.zero;
  late TextAlign _textAlign = TextAlign.center;

  AppTextBuilder(this._text);

  AppTextBuilder color(Color color) {
    _textColor = color;
    return this;
  }

  AppTextBuilder size(double size) {
    _fontSize = size;
    return this;
  }

  AppTextBuilder opacity(double opacity) {
    _textOpacity = opacity;
    return this;
  }

  AppTextBuilder weight(FontWeight weight) {
    _fontWeight = weight;
    return this;
  }

  AppTextBuilder paddingAll(double padding) {
    _padding = EdgeInsets.all(padding);
    return this;
  }

  AppTextBuilder paddingLeftRight(double padding) {
    _padding = EdgeInsets.only(left: padding, right: padding);
    return this;
  }

  AppTextBuilder paddingHorizontal(double padding) {
    _padding = EdgeInsets.only(left: padding, right: padding);
    return this;
  }

  AppTextBuilder paddingVertical(double padding) {
    _padding = EdgeInsets.only(top: padding, bottom: padding);
    return this;
  }

  AppTextBuilder textAlign(TextAlign textAlign) {
    _textAlign = textAlign;
    return this;
  }

  AppTextBuilder paddingHorizontalVertical(
      {required double paddingHorizontal, required double paddingVertical}) {
    _padding = EdgeInsets.only(
        top: paddingVertical,
        bottom: paddingVertical,
        left: paddingHorizontal,
        right: paddingHorizontal);
    return this;
  }

  AppTextBuilder paddingSpecific(
      {double top = 0, double bottom = 0, double left = 0, double right = 0}) {
    _padding =
        EdgeInsets.only(top: top, bottom: bottom, left: left, right: right);
    return this;
  }

  AppText build() {
    return AppText._builder(_text, _textColor, _fontSize, _textOpacity,
        _fontWeight, _padding, _textAlign);
  }
}
