// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
// import 'package:jb_fe/constants/colors.dart';
// import 'package:jb_fe/constants/typography/font_weight.dart';
// import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';
// import 'package:jb_fe/controllers/bloc/inventory/party_search_for_order/party_search_for_order_bloc.dart';
// import 'package:jb_fe/widgets/body/authenticated/cart/party_section/party_selection_search.dart';
// import 'package:jb_fe/widgets/calligraphy/app_text.dart';
// import 'package:jb_fe/widgets/svg/icons/app_icons.dart';
//
// import '../../../../../injection_container.dart';
//
// class PartySelectionForOrder extends StatefulWidget {
//   const PartySelectionForOrder({Key? key}) : super(key: key);
//
//   @override
//   State<PartySelectionForOrder> createState() => _PartySelectionForOrderState();
// }
//
// class _PartySelectionForOrderState extends State<PartySelectionForOrder> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.grey_2,
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         constraints: const BoxConstraints(maxWidth: 1000),
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               flex: 1,
//               child: BlocProvider(
//                 create: (context) => serviceLocator<PartySearchForOrderBloc>(),
//                 child: BlocBuilder<PartySearchForOrderBloc,
//                     PartySearchForOrderState>(
//                   builder: (context, state) {
//                     return PartySelectionSearch(
//                       partyList: state.result,
//                       onPartySelectCallback: _onPartySelected,
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: BlocBuilder<CartBloc, CartState>(
//                 builder: (BuildContext context, CartState state) {
//                   if (state.party != null) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.account_circle,
//                               color: AppColors.grey_3,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             AppTextBuilder(state.party!.name)
//                                 .color(AppColors.blue_5)
//                                 .weight(AppFontWeight.BOLD)
//                                 .size(16)
//                                 .build()
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 30,
//                         ),
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.call,
//                               color: AppColors.grey_3,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             AppTextBuilder(state.party!.contactNo)
//                                 .color(AppColors.green_1)
//                                 .weight(AppFontWeight.BOLD)
//                                 .size(16)
//                                 .build()
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 30,
//                         ),
//                         Row(
//                           children: [
//                             const Icon(
//                               AppIcons.rupee,
//                               color: AppColors.grey_3,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             AppTextBuilder(state.party!.balance.toString())
//                                 .color(state.party!.balance > 0
//                                     ? AppColors.green_1
//                                     : AppColors.red_2)
//                                 .weight(AppFontWeight.BOLD)
//                                 .build()
//                           ],
//                         )
//                       ],
//                     );
//                   }
//                   return AppTextBuilder("Please select party first")
//                       .size(16)
//                       .color(AppColors.red_2)
//                       .weight(AppFontWeight.BOLD)
//                       .build();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _onPartySelected(PartyPresentation party) {
//     BlocProvider.of<CartBloc>(context).add(AddPartyToCart(party: party));
//   }
// }
