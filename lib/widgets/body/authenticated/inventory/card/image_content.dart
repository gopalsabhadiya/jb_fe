import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_image/item_image_bloc.dart';
import 'package:jb_fe/widgets/svg/diamond_svg.dart';

class ItemImageContent extends StatelessWidget {
  const ItemImageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemImageBloc, ItemImageState>(
      builder: (BuildContext context, ItemImageState state) {
        switch (state.status) {
          case ItemImageStatus.LOADING:
            return SizedBox(
              width: 250,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue_5),
                    backgroundColor: AppColors.blue_2,
                  ),
                ],
              ),
            );
          case ItemImageStatus.SUCCESS_WITH_IMAGES:
            return SizedBox(
              width: 250,
              height: 250,
              child: Image.memory(state.imageMap.values.first),
            );
          case ItemImageStatus.SUCCESS_WITH_NO_IMAGES:
            return const SizedBox(
              width: 250,
              height: 250,
              child: DiamondSVG(),
            );
          case ItemImageStatus.FAILURE:
            return const SizedBox(
              width: 250,
              height: 250,
              child: DiamondSVG(),
            );
          case ItemImageStatus.NO_IMAGES:
            return const SizedBox(
              width: 250,
              height: 250,
              child: DiamondSVG(),
            );
        }
      },
    );
  }
}
