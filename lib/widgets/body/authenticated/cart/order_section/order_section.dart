// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jb_fe/constants/colors.dart';
// import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';
// import 'package:jb_fe/widgets/body/authenticated/cart/order_section/order_item_section.dart';
//
// import '../no_items.dart';
// import 'order_bottom_section.dart';
// import 'order_details_section.dart';
//
// class OrderSectionForCart extends StatelessWidget {
//   final VoidCallback _closeDrawer;
//   const OrderSectionForCart({Key? key, required closeDrawer})
//       : _closeDrawer = closeDrawer,
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       constraints: const BoxConstraints(maxWidth: 1000),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: BlocBuilder<CartBloc, CartState>(
//         builder: (BuildContext context, CartState state) {
//           if (state.order.items.isEmpty) {
//             return NoItems(closeDrawer: _closeDrawer);
//           }
//           return Column(
//             children: [
//               OrderDetailsSectionInCart(
//                 order: state.order,
//               ),
//               OrderItemSection(
//                 order: state.order,
//                 closeDrawer: _closeDrawer,
//               ),
//               OrderBottomSection(
//                 order: state.order,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
