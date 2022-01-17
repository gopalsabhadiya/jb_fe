import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/constants/enum/labour_type_enum.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/controllers/bloc/business/business_data_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/pieces_enabler/pieces_enabler_cubit.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/section/mid/category_type.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
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
      List.generate(LabourTypeEnum.values.length, (index) => false);
  late bool _piecesEnabled;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) =>
        print("Midsectionbuilt: ${DateTime.now().millisecondsSinceEpoch}"));
    _piecesEnabled =
        widget._item.newHuid == null || widget._item.newHuid!.isEmpty;
    _labourTypeSelections[
        LabourTypeEnum.values.indexOf(widget._item.newLabour!.type)] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Building mid section: ${DateTime.now().millisecondsSinceEpoch}");
    return BlocProvider(
      create: (BuildContext context) {
        final PiecesEnablerCubit cubit = serviceLocator<PiecesEnablerCubit>();
        if (widget._item.newHuid == null || widget._item.newHuid!.isEmpty) {
          cubit.positive();
        }
        return cubit;
      },
      child: Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              Row(
                children: [
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
                    width: 10,
                  ),
                  Expanded(
                    child: AppTextInput(
                      initialValue: widget._item.newHuid,
                      prefixIcon: AppIcons.id,
                      hint: ItemText.HUID_INPUT_TEXT,
                      onChanged: (String value) => _setNewHuid(context, value),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // AppTextBuilder("Hello").build()
                  Expanded(
                    child: BlocBuilder<PiecesEnablerCubit, PiecesEnablerState>(
                      builder:
                          (BuildContext context, PiecesEnablerState state) {
                        return AppTextInput(
                          initialValue: widget._item.newStockPieces.toString(),
                          enabled: state.value,
                          prefixIcon: Icons.extension,
                          hint: ItemText.PIECE_INPUT_TEXT,
                          onChanged: widget._item.setNewStockPieces,
                          validator: widget._item.newStockPiecesValidator,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppTextInput(
                      initialValue: widget._item.newGrossWeight != 0
                          ? widget._item.newGrossWeight.toString()
                          : DefaultTexts.EMPTY,
                      prefixIcon: AppIcons.gross_weight,
                      hint: ItemText.GW_INPUT_TEXT,
                      onChanged: widget._item.setNewGrossWeight,
                      validator: widget._item.newGrossWeightValidator,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppTextInput(
                      initialValue: widget._item.newNetWeight != 0
                          ? widget._item.newNetWeight.toString()
                          : DefaultTexts.EMPTY,
                      prefixIcon: AppIcons.net_weight,
                      hint: ItemText.NW_INPUT_TEXT,
                      onChanged: widget._item.setNewNetWeight,
                      validator: widget._item.newNetWeightValidator,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
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
                    width: 10,
                  ),
                  Expanded(
                    child: AppTextInput(
                      initialValue: widget._item.newLabour != null &&
                              widget._item.newLabour!.value != null
                          ? widget._item.newLabour!.value.toString()
                          : DefaultTexts.EMPTY,
                      prefixIcon: Icons.engineering,
                      hint: ItemText.LABOUR_INPUT_TEXT,
                      onChanged: widget._item.newLabour!.setNewValue,
                      validator: widget._item.newLabour!.newValueValidator,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
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
        },
      ),
    );
  }

  List<Widget> _getLabourTypes() {
    List<Widget> _items = [];

    for (int i = 0; i < LabourTypeEnum.values.length; i++) {
      if (_labourTypeSelections[i]) {
        _items.add(AppTextBuilder(LabourTypeEnum.values[i].name())
            .color(AppColors.white)
            .size(16)
            .paddingAll(10)
            .build());
      } else {
        _items.add(AppTextBuilder(LabourTypeEnum.values[i].name())
            .color(AppColors.blue_5)
            .size(16)
            .paddingAll(10)
            .build());
      }
    }
    return _items;
  }

  void _onLabourTypeChange(int index) {
    widget._item.newLabour!.setNewType(LabourTypeEnum.values[index]);
    setState(() {
      for (int i = 0; i < _labourTypeSelections.length; i++) {
        _labourTypeSelections[i] = i == index ? true : false;
      }
    });
  }

  _setNewHuid(BuildContext context, String newHuid) {
    if (newHuid.isNotEmpty) {
      widget._item.setNewStockPieces(1.toString());
      _piecesEnabled = false;
      BlocProvider.of<PiecesEnablerCubit>(context).negative();
    } else {
      _piecesEnabled = true;
      BlocProvider.of<PiecesEnablerCubit>(context).positive();
    }
    widget._item.setNewHuid(newHuid);
  }
}
