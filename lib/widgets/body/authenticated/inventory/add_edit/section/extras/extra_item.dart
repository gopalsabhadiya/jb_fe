import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/item/item_extra_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/widgets/common/inputs/dropdown_button.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class ExtraItemForm extends StatelessWidget {
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
  Widget build(BuildContext context) {
    print("Building extra item");
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
                      initialValue:
                          _extra.newType != null && _extra.newType!.isNotEmpty
                              ? _extra.newType
                              : "Diamond",
                      items: _extraTypes,
                      prefixIcon: AppIcons.crystal,
                      onSetValue: _extra.setNewType,
                      hint: ItemText.EXTRA_TYPE_INPUT_TEXT,
                      validator: _extra.newTypeValidator,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextInput(
                      initialValue: _extra.newPieces != null
                          ? _extra.newPieces.toString()
                          : DefaultTexts.EMPTY,
                      prefixIcon: Icons.extension,
                      hint: ItemText.EXTRA_PIECE_INPUT_TEXT,
                      onChanged: _extra.setNewPieces,
                      validator: _extra.newPiecesValidator,
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
                        initialValue: _extra.newLabourCharge != null
                            ? _extra.newLabourCharge.toString()
                            : DefaultTexts.EMPTY,
                        prefixIcon: Icons.engineering,
                        hint: ItemText.EXTRA_LABOUR_INPUT_TEXT,
                        onChanged: _extra.setNewLabourCharge,
                        validator: _extra.newLabourValidator),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextInput(
                      initialValue: _extra.newRate != null
                          ? _extra.newRate.toString()
                          : DefaultTexts.EMPTY,
                      prefixIcon: Icons.local_offer,
                      hint: ItemText.EXTRA_ITEM_RATE_INPUT_TEXT,
                      onChanged: _extra.setNewRate,
                      validator: _extra.newRateValidator,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  onPressed: () => _onRemoveExtra(_extra.uuid),
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
}
