import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jb_fe/constants/location/assets.dart';

class DiamondSVG extends StatelessWidget {
  const DiamondSVG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetLocation.DIAMOND_SVG,
      fit: BoxFit.scaleDown,
    );
  }
}
