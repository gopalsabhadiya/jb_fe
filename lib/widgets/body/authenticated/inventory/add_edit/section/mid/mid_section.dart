import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/controllers/bloc/business/business_data_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/section/mid/category_type.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/dropdown_button.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class ItemInputMidSection extends StatefulWidget {
  final ItemPresentation _item;
  const ItemInputMidSection({
    Key? key,
    required item,
  })  : _item = item,
        super(key: key);

  @override
  State<ItemInputMidSection> createState() => _ItemInputMidSectionState();
}

class _ItemInputMidSectionState extends State<ItemInputMidSection> {
  final List<bool> _labourTypeSelections =
      List.generate(ItemText.LABOUR_TYPE_LIST.length, (index) => false);

  @override
  void initState() {
    _labourTypeSelections[
        ItemText.LABOUR_TYPE_LIST.indexOf(widget._item.labour!.type)] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // AppTextBuilder("Hello").build()
            Expanded(
              flex: 2,
              child: CategoryTypeSelector(
                item: widget._item,
                itemCollection: BlocProvider.of<BusinessDataBloc>(context)
                    .state
                    .business!
                    .itemCollection,
              ),
            ),

            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: AppTextInput(
                initialValue: widget._item.newHuid,
                prefixIcon: AppIcons.id,
                hint: ItemText.HUID_INPUT_TEXT,
                onChanged: widget._item.setNewHuid,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            // AppTextBuilder("Hello").build()
            Expanded(
              child: AppTextInput(
                initialValue: widget._item.newStockPieces.toString(),
                prefixIcon: Icons.extension,
                hint: ItemText.PIECE_INPUT_TEXT,
                onChanged: widget._item.setNewStockPieces,
                validator: widget._item.newStockPiecesValidator,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: AppTextInput(
                initialValue: widget._item.newGrossWeight.toString(),
                prefixIcon: AppIcons.gross_weight,
                hint: ItemText.GW_INPUT_TEXT,
                onChanged: widget._item.setNewGrossWeight,
                validator: widget._item.newGrossWeightValidator,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: AppTextInput(
                initialValue: widget._item.newNetWeight.toString(),
                prefixIcon: AppIcons.net_weight,
                hint: ItemText.NW_INPUT_TEXT,
                onChanged: widget._item.setNewNetWeight,
                validator: widget._item.newNetWeightValidator,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            // AppTextBuilder("Hello").build()
            Expanded(
              child: AppTextInput(
                initialValue: widget._item.newCarat != null
                    ? widget._item.newCarat.toString()
                    : DefaultTexts.EMPTY,
                prefixIcon: AppIcons.karat,
                hint: ItemText.KARAT_INPUT_TEXT,
                onChanged: widget._item.setNewCarat,
                validator: widget._item.newCaratValidator,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: AppTextInput(
                initialValue: widget._item.newLabour!.value.toString(),
                prefixIcon: Icons.engineering,
                hint: ItemText.LABOUR_INPUT_TEXT,
                onChanged: widget._item.newLabour!.setNewValue,
                validator: widget._item.newLabour!.newValueValidator,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: ToggleButtons(
                isSelected: _labourTypeSelections,
                color: AppColors.blue_5,
                fillColor: AppColors.blue_5,
                borderRadius: BorderRadius.circular(100),
                selectedBorderColor: AppColors.blue_5,
                borderWidth: 2,
                highlightColor: AppColors.blue_1,
                borderColor: AppColors.blue_5,
                splashColor: AppColors.blue_5,
                children: _getLabourTypes(),
                onPressed: _onLabourTypeChange,
              ),
            )
          ],
        )
      ],
    );
  }

  List<Widget> _getLabourTypes() {
    List<Widget> _items = [];
    for (int i = 0; i < ItemText.LABOUR_TYPE_LIST.length; i++) {
      if (_labourTypeSelections[i]) {
        _items.add(AppTextBuilder(ItemText.LABOUR_TYPE_LIST[i])
            .color(AppColors.white)
            .size(16)
            .paddingAll(12)
            .build());
      } else {
        _items.add(AppTextBuilder(ItemText.LABOUR_TYPE_LIST[i])
            .color(AppColors.blue_5)
            .size(16)
            .paddingAll(12)
            .build());
      }
    }
    return _items;
  }

  void _onLabourTypeChange(int index) {
    widget._item.newLabour!.setNewType(ItemText.LABOUR_TYPE_LIST[index]);
    setState(() {
      for (int i = 0; i < _labourTypeSelections.length; i++) {
        _labourTypeSelections[i] = i == index ? true : false;
      }
    });
  }
}
