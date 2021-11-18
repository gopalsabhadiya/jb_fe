class LoginFormDTO {
  late String email;
  late String password;

  String get getEmail {
    return email;
  }

  String get getPassword {
    return password;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  Map<String, dynamic> toJson() => {"email": email, "password": password};
  @override
  String toString() {
    return 'LoginFormDTO{email: $email, password: $password}';
  }
}
