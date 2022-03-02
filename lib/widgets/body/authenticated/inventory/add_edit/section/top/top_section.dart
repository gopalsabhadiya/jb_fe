import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';
import 'package:jb_fe/widgets/common/inputs/checkbox.dart';

import '../../../../../../../constants/texts/defaults.dart';
import '../../../../../../common/inputs/text_field.dart';
import '../../../../../../svg/icons/app_icons.dart';

class ItemInputTopSection extends StatefulWidget {
  final ItemPresentation _item;
  const ItemInputTopSection({
    Key? key,
    required item,
  })  : _item = item,
        super(key: key);

  @override
  State<ItemInputTopSection> createState() => _ItemInputTopSectionState();
}

class _ItemInputTopSectionState extends State<ItemInputTopSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppCheckbox(
          onChanged: _onPublicPrivateChange,
          hint: ItemText.PUBLIC_INPUT_TEXT,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppButton(
                    hint: ItemText.SELECT_IMAGE_INPUT_TEXT,
                    onClick: _onSelectImageClick,
                    colorScheme: ButtonColorScheme.BLUE,
                  ),
                  AppButton(
                    hint: ItemText.CLEAR_IMAGES_INPUT_TEXT,
                    onClick: _onClearImageClick,
                    colorScheme: ButtonColorScheme.RED,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Opacity(
                  opacity: 0.5,
                  child: InkWell(
                    onTap: _onSelectImageClick,
                    child: DottedBorder(
                      dashPattern: const [4, 3],
                      strokeWidth: 2,
                      strokeCap: StrokeCap.butt,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.grey_2,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 60,
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.cloud_upload,
                              size: 65,
                              color: AppColors.blue_5,
                            ),
                            AppTextBuilder("Select Images")
                                .size(20)
                                .color(AppColors.blue_5)
                                .build()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _getImages(),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 200,
          child: AppTextInput(
            initialValue: widget._item.newUserDefinedId != null &&
                    widget._item.newUserDefinedId!.isNotEmpty
                ? widget._item.newUserDefinedId.toString()
                : DefaultTexts.EMPTY,
            prefixIcon: AppIcons.id,
            hint: ItemText.USER_DEFINED_ID_TEXT,
            onChanged: widget._item.setNewUserDefinedId,
          ),
        ),
      ],
    );
  }

  List<Widget> _getImages() {
    List<Widget> imageNames = <Widget>[];
    if (widget._item.newImages != null) {
      for (final PlatformFile imageFile in widget._item.newImages!) {
        imageNames.add(AppTextBuilder(imageFile.name)
            .color(AppColors.blue_5)
            .size(16)
            .build());
      }
    }
    return imageNames;
  }

  void _onSelectImageClick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
      allowMultiple: true,
    );
    if (result != null) {
      for (var element in result.files) {
        if (!widget._item.addNewImage(element)) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.red_2,
            content: Text("Maximum 4 images are allowed"),
          ));
          break;
        } else {
          setState(() {});
        }
      }
    }
  }

  void _onClearImageClick() {
    widget._item.clearNewImages();
    setState(() {});
  }

  _onPublicPrivateChange(bool newValue) {
    print("Checkbox changed to $newValue");
  }
}
