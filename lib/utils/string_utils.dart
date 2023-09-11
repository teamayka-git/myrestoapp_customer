class StringUtils {
  String durationToString(int durationInt) {
    final Duration duration = Duration(milliseconds: durationInt.abs());

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    // String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    var returnString = "";

    if (duration.inDays != 0) {
      if (duration.inDays == 1) {
        returnString += "${duration.inDays} Day - ";
      } else {
        returnString += "${duration.inDays} Days - ";
      }
    }

    // returnString += "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
    returnString += "$twoDigitHours:$twoDigitMinutes";
    return returnString;
  }

  String changeSubstringAtIndex(
      {required String fullString,
      required String subString,
      required int position}) {
    if (fullString.length < position) {
      return fullString;
    }

    var before = fullString.substring(0, position);
    var after =
        fullString.substring(position + subString.length, fullString.length);
    return before + subString + after;
  }

  String getUpiQrData(String upiId, double amount) {
    var qr =
        "upi://pay?pa=$upiId&pn=Test&tr=&am=$amount&cu=INR&mode=01&purpose=10&orgid=-&sign=-&tn=note";
    return qr;
  }
}
