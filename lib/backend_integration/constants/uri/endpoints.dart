class EndpointUri {
  //static const String _SERVER_ADDRESS = "https://j-m-s.herokuapp.com";
  static const String _SERVER_ADDRESS = "http://localhost:8080";
  // static const String _SERVER_ADDRESS = "http://10.0.2.2:8080";

  static const String _PATH_USER_ID = "{USER_ID}";
  static const String _PATH_BUSINESS_ID = "{BUSINESS_ID}";
  static const String _PATH_PARTY_ID = "{PARTY_ID}";
  static const String _PATH_ITEM_ID = "{ITEM_ID}";
  static const String _PATH_ORDER_ID = "{ORDER_ID}";
  static const String _ID = "{ID}";
  static const String _SKIP = "{SKIP}";
  static const String _SEARCH_TERM = "{SEARCH_TERM}";

  static const String _BASE_URL = "$_SERVER_ADDRESS/api";

  static const String _BASE_USER = "$_BASE_URL/user";
  static const String _BASE_AUTH = "$_BASE_URL/auth";
  static const String _VALIDATE_AUTH = "$_BASE_AUTH/validate";
  static const String _BASE_BUSINESS = "$_BASE_URL/business";

  static const String _BASE_PARTY = "$_BASE_URL/party";
  static const String _PARTY_SKIP = "$_BASE_PARTY/?skip=$_SKIP";
  static const String _DELETE_PARTY = "$_BASE_PARTY/$_PATH_PARTY_ID";
  static const String _SEARCH_PARTY =
      "$_BASE_PARTY/?skip=$_SKIP&searchTerm=$_SEARCH_TERM";
  static const String _GET_PARTY_BY_ID = "$_BASE_PARTY/id/$_PATH_PARTY_ID";

  static const String _BASE_ITEM = "$_BASE_URL/item";
  static const String _ITEM_SKIP = "$_BASE_ITEM/?skip=$_SKIP";
  static const String _DELETE_ITEM = "$_BASE_ITEM/$_PATH_ITEM_ID";
  static const String _SEARCH_ITEM =
      "$_BASE_ITEM/?skip=$_SKIP&searchTerm=$_SEARCH_TERM";
  static const String _ITEM_IMAGE_URL = "$_BASE_URL/image/item";
  static const String _UPLOAD_IMAGE_SIGNED_URL =
      "$_ITEM_IMAGE_URL/post_signed_url?id=$_ID";
  static const String _DOWNLOAD_IMAGE_SIGNED_URL =
      "$_ITEM_IMAGE_URL/fetch_signed_url?id=$_ID";

  static const String _BASE_DAILY_GOLD_RATE = "$_BASE_URL/daily_gold_rate";

  static const String _BASE_ORDER = "$_BASE_URL/order";
  static const String _ORDER_SKIP = "$_BASE_ORDER/details?skip=$_SKIP";
  static const String _SEARCH_ORDER =
      "$_BASE_ORDER/details?skip=$_SKIP&searchTerm=$_SEARCH_TERM";
  static const String _DELETE_ORDER = "$_BASE_ORDER/$_PATH_ORDER_ID";
  static const String _GET_ORDER_BY_ID = "$_BASE_ORDER/id/$_PATH_ORDER_ID";

  static const String _BASE_BILL = "$_BASE_URL/bill";
  static const String _BASE_RECEIPT = "$_BASE_URL/receipt";

  static const String _GET_USER = _BASE_USER;
  static const String _VERIFY_USER = "$_BASE_USER/verify";
  static const String _DELETE_USER = "$_BASE_USER/$_PATH_USER_ID";

  static const _DELETE_BUSINESS = "$_BASE_BUSINESS/$_PATH_BUSINESS_ID";
  static const _ITEM_COLLECTION = "$_BASE_BUSINESS/itemcollection";

  static Uri getCreateUserURL() {
    return Uri.parse(_BASE_USER);
  }

  static Uri getGetUserURL() {
    return Uri.parse(_GET_USER);
  }

  static Uri getVerifyUserURL() {
    return Uri.parse(_VERIFY_USER);
  }

  static Uri getDeleteUserURL({required String userId}) {
    return Uri.parse(_DELETE_USER.replaceAll(_PATH_USER_ID, userId));
  }

  static Uri getAuthenticateURL() {
    print("Base Authentication: $_BASE_AUTH");
    return Uri.parse(_BASE_AUTH);
  }

  static Uri getValidateAuthenticationURL() {
    return Uri.parse(_VALIDATE_AUTH);
  }

  static Uri getGetBusinessURL() {
    return Uri.parse(_BASE_BUSINESS);
  }

  static Uri getRegisterBusinessURL() {
    return Uri.parse(_BASE_BUSINESS);
  }

  static Uri getUpdateBusinessURL() {
    return Uri.parse(_BASE_BUSINESS);
  }

  static Uri getDeleteBusinessURL({required String businessId}) {
    return Uri.parse(
        _DELETE_BUSINESS.replaceAll(_PATH_BUSINESS_ID, businessId));
  }

  static Uri getBaseParty() {
    return Uri.parse(_BASE_PARTY);
  }

  static Uri getUpdatePartyURL() {
    return Uri.parse(_BASE_PARTY);
  }

  static Uri getDeletePartyURL(String partyId) {
    return Uri.parse(_DELETE_PARTY.replaceAll(_PATH_PARTY_ID, partyId));
  }

  static Uri getPartyPage(int skip) {
    print("Returning URI party page: $skip");
    return Uri.parse(_PARTY_SKIP.replaceAll(_SKIP, skip.toString()));
  }

  static Uri getSearchPartyURL(int skip, String searchTerm) {
    return Uri.parse(_SEARCH_PARTY
        .replaceAll(_SKIP, skip.toString())
        .replaceAll(_SEARCH_TERM, searchTerm));
  }

  static Uri getPartyByIdURL(String orderId) {
    return Uri.parse(_GET_PARTY_BY_ID.replaceAll(_PATH_PARTY_ID, orderId));
  }

  static Uri getAddItemURL() {
    return Uri.parse(_BASE_ITEM);
  }

  static Uri getUpdateItemURL() {
    return Uri.parse(_BASE_ITEM);
  }

  static Uri getUploadImageSignedItemURL(String itemId) {
    return Uri.parse(_UPLOAD_IMAGE_SIGNED_URL.replaceAll(_ID, itemId));
  }

  static Uri getDownloadImageSignedItemURL(String itemId) {
    return Uri.parse(_DOWNLOAD_IMAGE_SIGNED_URL.replaceAll(_ID, itemId));
  }

  static Uri getDeleteItemURL(String itemId) {
    return Uri.parse(_DELETE_ITEM.replaceAll(_PATH_ITEM_ID, itemId));
  }

  static Uri getItemPage(int skip) {
    return Uri.parse(_ITEM_SKIP.replaceAll(_SKIP, skip.toString()));
  }

  static Uri getSearchItemURL(int skip, String searchTerm) {
    return Uri.parse(_SEARCH_ITEM
        .replaceAll(_SKIP, skip.toString())
        .replaceAll(_SEARCH_TERM, searchTerm));
  }

  static Uri getAddOrderURL() {
    return Uri.parse(_BASE_ORDER);
  }

  static Uri getOrderPageURL(int skip) {
    return Uri.parse(_ORDER_SKIP.replaceAll(_SKIP, skip.toString()));
  }

  static Uri getSearchOrderURL(int skip, String searchTerm) {
    return Uri.parse(_SEARCH_ORDER
        .replaceAll(_SKIP, skip.toString())
        .replaceAll(_SEARCH_TERM, searchTerm));
  }

  static Uri getDeleteOrderURL(String orderId) {
    return Uri.parse(_DELETE_ORDER.replaceAll(_PATH_ORDER_ID, orderId));
  }

  static Uri getOrderByIdURL(String orderId) {
    return Uri.parse(_GET_ORDER_BY_ID.replaceAll(_PATH_ORDER_ID, orderId));
  }

  static Uri getCreateDailyGoldRateURL() {
    return Uri.parse(_BASE_DAILY_GOLD_RATE);
  }

  static Uri getGetTodayGoldRateURL() {
    return Uri.parse(_BASE_DAILY_GOLD_RATE);
  }
}
