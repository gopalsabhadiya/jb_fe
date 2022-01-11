import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button_circle.dart';

class FilterPaymentButton extends StatelessWidget {
  const FilterPaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppIconButtonCircleBuilder(Icons.filter_alt).build(),
    );
  }
}
