import 'package:jb_fe/backend_integration/constants/enum/labour_type_enum.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';

class ItemUtils {
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
        return (item.itemAmount! * item.labour!.value! * 0.01) *
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
