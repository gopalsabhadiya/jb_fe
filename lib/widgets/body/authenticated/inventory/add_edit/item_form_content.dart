import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/section/extras/extras_section.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/section/mid/mid_section.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/section/top/top_section.dart';

class ItemFormContent extends StatefulWidget {
  final ItemPresentation _item;
  const ItemFormContent({Key? key, required ItemPresentation item})
      : _item = item,
        super(key: key);

  @override
  State<ItemFormContent> createState() => _ItemFormContentState();
}

class _ItemFormContentState extends State<ItemFormContent> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => print(
        "Content section built: ${DateTime.now().millisecondsSinceEpoch}"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ItemInputTopSection(item: widget._item),
        const SizedBox(
          height: 30,
        ),
        ItemInputMidSection(item: widget._item),
        const SizedBox(
          height: 30,
        ),
        ItemInputExtrasSection(item: widget._item)
      ],
    );
  }
}
