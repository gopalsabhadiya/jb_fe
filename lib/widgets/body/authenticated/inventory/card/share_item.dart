import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_image/item_image_bloc.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareItem extends StatefulWidget {
  final ItemPresentation _item;
  const ShareItem({Key? key, required ItemPresentation item})
      : _item = item,
        super(key: key);

  @override
  State<ShareItem> createState() => _ShareItemState();
}

class _ShareItemState extends State<ShareItem> {
  final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    _focusNode.addListener(() {
      print("Focus node listener called: ${_focusNode.hasFocus}");
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)!.insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Row(
        // width: 100,
        children: [
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(-3, size.height + 5.0),
            child: Material(
              elevation: 4.0,
              color: AppColors.grey_2,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Container(
                padding: const EdgeInsets.all(5),
                constraints: const BoxConstraints(maxHeight: 200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ShaderMask(
                    //   shaderCallback: (bounds) {
                    //     return const LinearGradient(
                    //       begin: Alignment(1, -1),
                    //       end: Alignment(-1, 1),
                    //       colors: [Colors.pink, Colors.red, Colors.yellow],
                    //     ).createShader(bounds);
                    //   },
                    //   child: AppIconButtonBuilder(AppIcons.instagram)
                    //       .onClickHandler(_shareOnIntstagram)
                    //       .size(25)
                    //       .color(AppColors.white)
                    //       .build(),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    AppIconButtonBuilder(AppIcons.whatsapp)
                        .onClickHandler(_shareOnWhatsapp)
                        .color(AppColors.green_1)
                        .size(25)
                        .build(),
                    const SizedBox(
                      height: 10,
                    ),
                    AppIconButtonBuilder(AppIcons.facebook)
                        .onClickHandler(_shareOnFacebook)
                        .color(AppColors.blue_5)
                        .size(25)
                        .build(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: AppIconButtonBuilder(Icons.share)
          .size(25)
          .onClickHandler(() => _shareThisItem(context))
          .color(AppColors.blue_5)
          .addFocusNode(_focusNode)
          .build(),
    );
  }

  void _shareThisItem(BuildContext context) async {
    if (Theme.of(context).platform == TargetPlatform.windows && kIsWeb) {
      print("Windows web platform");
      _focusNode.requestFocus();
    }
    // await Share.shareFiles(["./assets/Ring_1.jpg"], text: "Sharing this text");
  }

  void _shareOnIntstagram() async {
    print(
        "Share on Instagram ${widget._item.name} ${BlocProvider.of<ItemImageBloc>(context).state.imageMap.length}");
    if (await canLaunch("https://www.instagram.com/create/details/")) {
      await launch("https://www.instagram.com/create/details/");
    }
    // await Share.share("Sharing this text");
  }

  void _shareOnWhatsapp() async {
    print(
        "Share on whatsapp ${widget._item.name} ${BlocProvider.of<ItemImageBloc>(context).state.imageMap.length}");
    await Share.share("Sharing this text");
  }

  void _shareOnFacebook() {
    print(
        "Share on facebook ${widget._item.name} ${BlocProvider.of<ItemImageBloc>(context).state.imageMap.length}");
  }
}
