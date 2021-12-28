import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button_circle.dart';

class FilterItemButton extends StatelessWidget {
  const FilterItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppIconButtonCircleBuilder(Icons.filter_alt).build();
  }
}
