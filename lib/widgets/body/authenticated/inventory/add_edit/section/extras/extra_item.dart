import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/item/item_extra_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/widgets/common/inputs/dropdown_button.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class ExtraItemForm extends StatefulWidget {
  final ItemExtraPresentation _extra;
  final List<String> _extraTypes;
  final Function(String) _onRemoveExtra;

  const ExtraItemForm({
    Key? key,
    required extra,
    required List<String> extraTypes,
    required onRemoveExtra,
  })  : _extra = extra,
        _onRemoveExtra = onRemoveExtra,
        _extraTypes = extraTypes,
        super(key: key);

  @override
  State<ExtraItemForm> createState() => _ExtraItemFormState();
}

class _ExtraItemFormState extends State<ExtraItemForm> {
  late final List<FocusNode> _focusNodeList;

  @override
  void initState() {
    _focusNodeList = [FocusNode(), FocusNode(), FocusNode()];
    super.initState();
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodeList) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 5, right: 5, left: 5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: AppColors.grey_3, //edited
                spreadRadius: 1,
                blurRadius: 3 //edited
                )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    AppDropDownButton(
                      initialValue: widget._extra.newType != null &&
                              widget._extra.newType!.isNotEmpty
                          ? widget._extra.newType
                          : DefaultTexts.EMPTY,
                      items: widget._extraTypes,
                      prefixIcon: AppIcons.crystal,
                      onSetValue: widget._extra.setNewType,
                      hint: ItemText.EXTRA_TYPE_INPUT_TEXT,
                      validator: widget._extra.newTypeValidator,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextInput(
                      onEditingComplete: () => _focusNextTextBox(1),
                      focusNode: _focusNodeList[1],
                      initialValue: widget._extra.newPieces != null
                          ? widget._extra.newPieces.toString()
                          : DefaultTexts.EMPTY,
                      prefixIcon: Icons.extension,
                      hint: ItemText.EXTRA_PIECE_INPUT_TEXT,
                      onChanged: widget._extra.setNewPieces,
                      validator: widget._extra.newPiecesValidator,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    AppTextInput(
                        onEditingComplete: () => _focusNextTextBox(0),
                        focusNode: _focusNodeList[0],
                        initialValue: widget._extra.newLabourCharge != null
                            ? widget._extra.newLabourCharge.toString()
                            : DefaultTexts.EMPTY,
                        prefixIcon: Icons.engineering,
                        hint: ItemText.EXTRA_LABOUR_INPUT_TEXT,
                        onChanged: widget._extra.setNewLabourCharge,
                        validator: widget._extra.newLabourValidator),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextInput(
                      onEditingComplete: () => _focusNextTextBox(2),
                      focusNode: _focusNodeList[2],
                      initialValue: widget._extra.newRate != null
                          ? widget._extra.newRate.toString()
                          : DefaultTexts.EMPTY,
                      prefixIcon: Icons.local_offer,
                      hint: ItemText.EXTRA_ITEM_RATE_INPUT_TEXT,
                      onChanged: widget._extra.setNewRate,
                      validator: widget._extra.newRateValidator,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  onPressed: () => widget._onRemoveExtra(widget._extra.uuid),
                  icon: const Icon(
                    Icons.cancel,
                    size: 35,
                    color: AppColors.red_2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _focusNextTextBox(int currentNodeIndex) {
    if (currentNodeIndex + 1 < _focusNodeList.length) {
      _focusNodeList[currentNodeIndex + 1].requestFocus();
    }
  }
}
