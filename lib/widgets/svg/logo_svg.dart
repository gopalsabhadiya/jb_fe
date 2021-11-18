import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jb_fe/constants/location/assets.dart';
import 'package:jb_fe/util/screen_size.dart';

class LogoSVG extends StatelessWidget {
  LogoSVG({Key? key}) : super(key: key);

  final SvgPicture _logoSvg = SvgPicture.asset(AssetLocation.LOGO_SVG);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 20 + ScreenSizeUtil.getWidthWidthAddition(context, 10),
        width: 150 + ScreenSizeUtil.getWidthWidthAddition(context, 110),
        child: _logoSvg);
  }
}
