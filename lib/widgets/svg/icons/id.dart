import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jb_fe/constants/location/assets.dart';
import 'package:jb_fe/constants/sizes/feaure_icons.dart';

class IconID extends StatelessWidget {
  const IconID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        AssetLocation.ICON_UI,
        fit: BoxFit.scaleDown,
    );
  }
}
