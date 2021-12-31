import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_form_toggle/item_form_toggle_cubit.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button_circle.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppIconButtonCircleBuilder(Icons.add)
        .onClickHandler(
          () => BlocProvider.of<ItemFormToggleCubit>(context).openDrawer(
            toggleForItem: const ToggleForNewItem(),
          ),
        )
        .build();
  }
}
