import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/controllers/bloc/inventory/add_item/add_item_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_bloc/item_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_form_toggle/item_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/inventory/update_item/update_item_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/add_item.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/edit_item.dart';

class ItemFormDrawer extends StatefulWidget {
  const ItemFormDrawer({Key? key}) : super(key: key);

  @override
  State<ItemFormDrawer> createState() => _ItemFormDrawerState();
}

class _ItemFormDrawerState extends State<ItemFormDrawer>
    with TickerProviderStateMixin {
  late Animation<Offset> animation;

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: AnimationDuration.SHORT,
    );
    animation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Container(
        width: ScreenSizeUtil.getBottomDrawerWidth(context),
        height: ScreenSizeUtil.getBottomDrawerHeight(context),
        color: AppColors.blue_1,
        child: BlocBuilder<ItemFormToggleCubit, ItemFormToggleState>(
          builder: (BuildContext context, ItemFormToggleState state) {
            if (state.toggleForItem is ToggleForItemUpdate) {
              _openDrawer();
              return BlocProvider<UpdateItemBloc>(
                create: (BuildContext context) =>
                    serviceLocator<UpdateItemBloc>()
                      ..subscribe(
                        subscriber: BlocProvider.of<ItemBloc>(context),
                      ),
                child: EditItem(
                  closeDrawer: _cancelUpdate,
                  item: (state.toggleForItem as ToggleForItemUpdate)
                      .itemToBeUpdated,
                ),
              );
            }
            if (state.toggleForItem is ToggleForNewItem) {
              _openDrawer();
              return BlocProvider<AddItemBloc>(
                create: (BuildContext context) => serviceLocator<AddItemBloc>()
                  ..subscribe(
                    subscriber: BlocProvider.of<ItemBloc>(context),
                  ),
                child: AddItem(
                  closeDrawer: _closeDrawer,
                  item: ItemPresentation.empty(),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _openDrawer() {
    animationController.forward();
  }

  void _closeDrawer() {
    animationController.reverse();
    BlocProvider.of<ItemFormToggleCubit>(context).closeDrawer();
  }

  _cancelUpdate() {
    _closeDrawer();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
