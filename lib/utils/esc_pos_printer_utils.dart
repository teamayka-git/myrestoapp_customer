class EscPosPrinterUtils {
  String stringWithMaxCharacters(
      {required int maxCharacterCount,
      required String data,
      required bool isBlankSpacePrefix}) {
    String returnString = "";

    if (isBlankSpacePrefix) {
      for (int i = 0; i < (maxCharacterCount - data.length); i++) {
        returnString += " ";
      }
    }
    returnString += data;

    if (!isBlankSpacePrefix) {
      for (int i = 0; i < (maxCharacterCount - data.length); i++) {
        returnString += " ";
      }
    }
    return returnString;
  }
}
