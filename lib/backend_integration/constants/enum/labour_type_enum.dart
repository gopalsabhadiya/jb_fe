extension ParseToString on LabourTypeEnum {
  String name() {
    switch (this) {
      case LabourTypeEnum.PERCENTAGE:
        return "Percentage";
      case LabourTypeEnum.PER_GRAM:
        return "Per Gram";
      case LabourTypeEnum.TOTAL:
        return "Total";
    }
  }
}

enum LabourTypeEnum {
  PERCENTAGE,
  PER_GRAM,
  TOTAL,
}
