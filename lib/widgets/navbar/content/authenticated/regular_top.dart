import 'package:flutter/cupertino.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class AuthenticatedNavbar extends StatelessWidget {
  const AuthenticatedNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextBuilder("Hello").build();
  }
}
