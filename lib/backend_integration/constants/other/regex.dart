class RegexConstants {
  static final RegExp NUMBER_REGEX = RegExp(r"[0-9.]");
  static final RegExp PAN_NO_REGEX = RegExp(r"^[a-zA-Z0-9]{10}$");
  static final RegExp EMAIL_REGEX = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
