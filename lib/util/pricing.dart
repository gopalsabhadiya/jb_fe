import 'dart:collection';

import 'package:jb_fe/constants/enum/pricing_enum.dart';
import 'package:jb_fe/constants/texts/pricing_text.dart';

class PricingUtil {
  static const List<String> FEATURES_LIST = [
    PricingText.FEATURE_1,
    PricingText.FEATURE_2,
    PricingText.FEATURE_3,
    PricingText.FEATURE_4,
    PricingText.FEATURE_5
  ];
  static final LinkedHashMap<String, bool> FREE_TIER_FEATURES =
      LinkedHashMap.from({
    PricingText.FEATURE_1: true,
    PricingText.FEATURE_2: true,
    PricingText.FEATURE_3: true,
    PricingText.FEATURE_4: false,
    PricingText.FEATURE_5: false
  });
  static final LinkedHashMap<String, bool> PAID_TIER_FEATURES =
      LinkedHashMap.from({
    PricingText.FEATURE_1: true,
    PricingText.FEATURE_2: true,
    PricingText.FEATURE_3: true,
    PricingText.FEATURE_4: true,
    PricingText.FEATURE_5: true
  });

  static LinkedHashMap<String, bool> getFeaturesFor(
      {required PricingTypeEum pricingType}) {
    switch (pricingType) {
      case PricingTypeEum.FREE:
        return FREE_TIER_FEATURES;
      case PricingTypeEum.PAID:
        return PAID_TIER_FEATURES;
    }
  }

  static String getPriceFor({required PricingTypeEum pricingType}) {
    switch (pricingType) {
      case PricingTypeEum.FREE:
        return PricingText.FREE_TIER_PRICE;
      case PricingTypeEum.PAID:
        return PricingText.PAID_TIER_PRICE;
    }
  }

  static String getDaysFor({required PricingTypeEum pricingType}) {
    switch (pricingType) {
      case PricingTypeEum.FREE:
        return PricingText.FREE_TIER_PERIOD;
      case PricingTypeEum.PAID:
        return PricingText.PAID_TIER_PERIOD;
    }
  }

  static String getHeader({required PricingTypeEum pricingType}) {
    switch (pricingType) {
      case PricingTypeEum.FREE:
        return PricingText.FREE_TIER_HEADER;
      case PricingTypeEum.PAID:
        return PricingText.PAID_TIER_HEADER;
    }
  }

  static String getBigCapsuleText({required PricingTypeEum pricingType}) {
    switch (pricingType) {
      case PricingTypeEum.FREE:
        return PricingText.FREE_TIER_BIG_CAPSULE_TEXT;
      case PricingTypeEum.PAID:
        return PricingText.PAID_TIER_BIG_CAPSULE_TEXT;
    }
  }

  static String getSmallCapsuleText({required PricingTypeEum pricingType}) {
    switch (pricingType) {
      case PricingTypeEum.FREE:
        return PricingText.FREE_TIER_SMALL_CAPSULE_TEXT;
      case PricingTypeEum.PAID:
        return PricingText.PAID_TIER_SMALL_CAPSULE_TEXT;
    }
  }
}
