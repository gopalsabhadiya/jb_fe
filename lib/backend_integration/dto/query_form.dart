class QueryFormDTO {
  late String _userEmail;
  late String _query;

  String get userEmail => _userEmail;

  void setUserEmail(String value) {
    _userEmail = value;
  }

  String get query => _query;

  void setQuery(String value) {
    _query = value;
  }

  @override
  String toString() {
    return 'QueryFormDTO{_userEmail: $_userEmail, _query: $_query}';
  }
}
