import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/mid_section.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/top_section.dart';

import 'extras_section.dart';

class ItemForm extends StatelessWidget {
  const ItemForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          padding: const EdgeInsets.all(20),
          constraints: BoxConstraints(maxWidth: 1366),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(2, 2),
                    color: AppColors.grey_3, //edited
                    spreadRadius: 1,
                    blurRadius: 5 //edited
                    )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              ItemInputTopSection(),
              SizedBox(
                height: 30,
              ),
              ItemInputMedSection(),
              SizedBox(
                height: 30,
              ),
              ItemInputExtrasSection()
            ],
          )),
    );
  }

  _onPublicPrivateChangge(bool newValue) {
    print("Checkbox changed to $newValue");
  }
}
