import 'dart:collection';

import 'package:jb_fe/constants/texts/pricing_text.dart';

class TierFeaturesMapping {
  static final LinkedHashMap<String, bool> FREE_TIER_MAPPING =
      LinkedHashMap.from({
    PricingText.FEATURE_1: true,
    PricingText.FEATURE_2: true,
    PricingText.FEATURE_3: true,
    PricingText.FEATURE_4: false,
    PricingText.FEATURE_5: false
  });
  static final LinkedHashMap<String, bool> PAID_TIER_MAPPING =
      LinkedHashMap.from({
    PricingText.FEATURE_1: true,
    PricingText.FEATURE_2: true,
    PricingText.FEATURE_3: true,
    PricingText.FEATURE_4: true,
    PricingText.FEATURE_5: true
  });
}
