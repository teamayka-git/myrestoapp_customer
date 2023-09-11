class SpinnerStringString {
  late String id;
  late String value;

  String get getid {
    return id;
  }

  set setId(String id) {
    this.id = id;
  }

  String get getValue {
    return value;
  }

  set setValue(String value) {
    this.value = value;
  }

  SpinnerStringString({
    required this.id,
    required this.value,
  });

  // LoginModel.create({required this.email, required this.password});
}
