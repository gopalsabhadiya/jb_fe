extension ParseToString on GSTTypeEnum {
  String name() {
    switch (this) {
      case GSTTypeEnum.CGST:
        return "CGST";
      case GSTTypeEnum.SGST:
        return "SGST";
      case GSTTypeEnum.UTGST:
        return "UTGST";
      case GSTTypeEnum.IGST:
        return "IGST";
    }
  }
}

enum GSTTypeEnum {
  CGST,
  SGST,
  UTGST,
  IGST,
}
