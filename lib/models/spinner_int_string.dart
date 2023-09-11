class SpinnerIntString {
  late int id;
  late String value;

  int get getid {
    return id;
  }

  set setId(int id) {
    this.id = id;
  }

  String get getValue {
    return value;
  }

  set setValue(String value) {
    this.value = value;
  }

  SpinnerIntString({
    required this.id,
    required this.value,
  });

  // LoginModel.create({required this.email, required this.password});
}
