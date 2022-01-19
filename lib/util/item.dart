import 'package:jb_fe/backend_integration/constants/enum/labour_type_enum.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/backend_integration/dto/order/gst_presentation.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/order/scrap_presentation.dart';

class ItemUtils {
  static void calculateAndSetOrderPriceDetails(
      {required OrderPresentation order}) {
    if (order.items.isEmpty) {
      return;
    }
    order.setNetAmmount(
      order.items
          .map(
            (item) => item.newNetAmount,
          )
          .reduce(
            (value, element) => value + element,
          ),
    );
    for (GSTPresentation gst in order.gst) {
      calculateAndSetGSTAmount(gst: gst, amount: order.netAmmount);
    }
    order.setTotalAmmount(
      order.netAmmount +
          order.gst
              .map(
                (gst) => gst.ammount,
              )
              .reduce(
                (value, element) => value + element,
              ),
    );
    if (order.scrap != null) {
      calculateAndSetScrapAmount(
          scrap: order.scrap!, goldRate: order.goldRate!);
      order.setScrapAmmount(order.scrap!.netAmmount);
      order.setFinalAmmount(
          order.totalAmmount - order.scrapAmmount! - (order.kasar ?? 0));
    } else {
      order.setFinalAmmount(order.totalAmmount - (order.kasar ?? 0));
    }
  }

  static void calculateAndSetGSTAmount(
      {required GSTPresentation gst, required double amount}) {
    gst.setAmmount(amount * gst.value * 0.01);
  }

  static void calculateAndSetScrapAmount(
      {required ScrapPresentation scrap, required double goldRate}) {
    if (scrap.touch == 0) {
      scrap.setNetAmmount(scrap.netWeight * goldRate * 0.1);
    } else {
      scrap
          .setNetAmmount(scrap.netWeight * goldRate * 0.1 * scrap.touch * 0.01);
    }
  }

  static void calculateAndSetItemPriceDetails(
      {required ItemPresentation item, required double goldRate}) {
    item.setNewItemAmount(calculateItemAmount(item: item, goldRate: goldRate));
    item.setNewNetAmount(
        calculateItemNetAmount(item: item, goldRate: goldRate));
  }

  static double calculateItemAmount({
    required ItemPresentation item,
    required double goldRate,
  }) {
    return item.netWeight * (goldRate / 10) * item.cartQuantity;
  }

  static double calculateItemNetAmount({
    required ItemPresentation item,
    required double goldRate,
  }) {
    return item.newItemAmount! +
        calculateExtraCharges(item: item) +
        calculateLabourCharges(item: item);
  }

  static double calculateExtraCharges({required ItemPresentation item}) {
    if (item.extras == null || item.extras!.isEmpty) {
      return 0;
    }
    for (var extra in item.extras!) {
      extra.calculateAndSetAmount();
    }
    return (item.extras!
                .where((extra) => extra.amount != null)
                .map((e) => e.amount)
                .reduce((value, element) => value! + element!) ??
            0) *
        item.cartQuantity;
  }

  static double calculateLabourCharges({required ItemPresentation item}) {
    if (item.labour == null ||
        item.labour!.value == null ||
        item.labour!.value == 0) {
      return 0;
    }

    switch (item.labour!.type) {
      case LabourTypeEnum.PERCENTAGE:
        return (item.newItemAmount! * item.labour!.value! * 0.01) *
            item.cartQuantity;
      case LabourTypeEnum.PER_GRAM:
        return item.netWeight * item.labour!.value! * item.cartQuantity;
      case LabourTypeEnum.TOTAL:
        return item.labour!.value! * item.cartQuantity;
      default:
        break;
    }
    return 0;
  }
}
