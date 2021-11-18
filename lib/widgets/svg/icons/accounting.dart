import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jb_fe/constants/location/assets.dart';
import 'package:jb_fe/constants/sizes/feaure_icons.dart';

class IconAccounting extends StatelessWidget {
  const IconAccounting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FeatureIconSize.height,
      width: FeatureIconSize.width,
      child: SvgPicture.asset(
        AssetLocation.ICON_ACCOUNTING,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
