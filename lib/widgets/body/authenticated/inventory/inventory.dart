import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/inventory/delete_item/delete_item_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_bloc/item_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_form_toggle/item_form_toggle_cubit.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/card/item_card.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/drawer/item_form_drawer.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  late ScrollController _scrollController;
  bool showEditItemDrawer = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.grey_4,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: BlocBuilder<ItemBloc, ItemState>(
                  builder: (BuildContext context, ItemState state) {
                    switch (state.status) {
                      case ItemStatus.INITIAL:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ItemStatus.LOADING:
                        _scrollController
                            .jumpTo(_scrollController.position.minScrollExtent);
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ItemStatus.SUCCESS:
                        return BlocProvider<DeleteItemBloc>(
                          create: (BuildContext context) =>
                              serviceLocator<DeleteItemBloc>()
                                ..subscribe(
                                  subscriber:
                                      BlocProvider.of<ItemBloc>(context),
                                ),
                          child: Wrap(
                            clipBehavior: Clip.hardEdge,
                            spacing: 20,
                            runSpacing: 20,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            children: _getItems(state.itemList),
                          ),
                        );
                      case ItemStatus.FAILURE:
                        return Center(
                          child:
                              AppTextBuilder("Failed to fetch Items").build(),
                        );
                    }
                  },
                ),
              ),
            ),
          ),
          const ItemFormDrawer()
        ],
      ),
    );
  }

  _onItemEdit(ItemPresentation item) {
    BlocProvider.of<ItemFormToggleCubit>(context).openDrawer(
      toggleForItem: ToggleForItemUpdate(itemToBeUpdated: item),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && _scrollController.position.extentAfter == 0) {
      BlocProvider.of<ItemBloc>(context).add(FetchNextItemPage());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  List<Widget> _getItems(List<ItemPresentation> itemList) {
    return itemList
        .map(
          (item) => ItemCard(
            item: item,
            onItemEdit: (item) => _onItemEdit(item),
          ),
        )
        .toList();
  }
}
