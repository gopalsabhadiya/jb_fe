import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/item/item_extra_presentation.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/controllers/bloc/business/business_data_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/section/extras/extra_item.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';

class ItemInputExtrasSection extends StatefulWidget {
  final ItemPresentation _item;

  const ItemInputExtrasSection({
    Key? key,
    required item,
  })  : _item = item,
        super(key: key);

  @override
  State<ItemInputExtrasSection> createState() => _ItemInputExtrasSectionState();
}

class _ItemInputExtrasSectionState extends State<ItemInputExtrasSection> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => print(
        "Extras section built: ${DateTime.now().millisecondsSinceEpoch}"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                offset: Offset(2, 2),
                color: AppColors.grey_3, //edited
                spreadRadius: 1,
                blurRadius: 4 //edited
                )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppTextBuilder(ItemText.EXTRA_ITEM_TEXT)
                      .size(30)
                      .color(AppColors.blue_5)
                      .build(),
                  AppButton(
                    icon: Icons.add_circle,
                    hint: ItemText.ADD_EXTRA_INPUT_TEXT,
                    onClick: _onAddExtra,
                    colorScheme: ButtonColorScheme.BLUE,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: AppColors.blue_1,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(5), bottom: Radius.circular(5)),
                ),
                child: Scrollbar(
                  isAlwaysShown: true,
                  interactive: true,
                  controller: controller,
                  child: ListView(
                    controller: controller,
                    children: _getExtraItemForm(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getExtraItemForm() {
    final extrasForms = <Widget>[];
    for (ItemExtraPresentation extra in widget._item.newExtras!) {
      extrasForms.add(
        ExtraItemForm(
          extraTypes:
              BlocProvider.of<BusinessDataBloc>(context).state.business!.extras,
          extra: extra,
          onRemoveExtra: _onRemoveExtra,
        ),
      );
    }
    return extrasForms;
  }

  void _onAddExtra() {
    widget._item.addNewExtra();
    setState(() {});
  }

  void _onRemoveExtra(String uuid) {
    widget._item.removeNewExtra(uuid);
    setState(() {});
  }
}
