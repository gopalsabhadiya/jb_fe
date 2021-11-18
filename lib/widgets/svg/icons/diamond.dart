import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jb_fe/constants/location/assets.dart';
import 'package:jb_fe/constants/sizes/feaure_icons.dart';

class IconDiamond extends StatelessWidget {
  const IconDiamond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FeatureIconSize.height,
      width: FeatureIconSize.width,
      child: SvgPicture.asset(
        AssetLocation.ICON_DIAMOND,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
