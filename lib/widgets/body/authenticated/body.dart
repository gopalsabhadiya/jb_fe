import 'package:flutter/cupertino.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class AppBodyAuthenticated extends StatelessWidget{
  const AppBodyAuthenticated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextBuilder("Authenticated").build();
  }

}