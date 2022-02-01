extension ParseToString on PaymentModeEnum {
  String name() {
    switch (this) {
      case PaymentModeEnum.Cash:
        return "Cash";
      case PaymentModeEnum.Check:
        return "Check";
      case PaymentModeEnum.Online:
        return "Online";
    }
  }
}

enum PaymentModeEnum { Cash, Check, Online }
