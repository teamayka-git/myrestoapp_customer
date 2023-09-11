class SyncFusionValueIntString {
  late String value;
  late int extraValue;

  String get getValue {
    return value;
  }

  set setId(String value) {
    this.value = value;
  }

  int get getExtraValue {
    return extraValue;
  }

  set setExtraValue(int extraValue) {
    this.extraValue = extraValue;
  }

  SyncFusionValueIntString({
    required this.value,
    required this.extraValue,
  });

  // LoginModel.create({required this.email, required this.password});
}
