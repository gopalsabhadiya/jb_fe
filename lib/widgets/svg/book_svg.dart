import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jb_fe/constants/location/assets.dart';
import 'package:jb_fe/util/screen_size.dart';

class BookSVG extends StatelessWidget {
  const BookSVG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140 + ScreenSizeUtil.getWidthWidthAddition(context, 95),
      width: 150 + ScreenSizeUtil.getWidthWidthAddition(context, 100),
      child: SvgPicture.asset(
        AssetLocation.BOOK_SVG,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
