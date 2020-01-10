class DiaperSizeBrain {
  final double weight; // in LB

  DiaperSizeBrain({this.weight});

  String getDiaperSize() {
    if (weight >= 1 && weight <= 6) {
      return "P";
    } else if (weight >= 6 && weight <= 9) {
      return "N";
    } else if (weight >= 10 && weight <= 14) {
      return "1";
    } else if (weight >= 15 && weight <= 18) {
      return "2";
    } else if (weight >= 19 && weight <= 28) {
      return "3";
    } else if (weight >= 28 && weight <= 32) {
      return "4";
    } else if (weight >= 33 && weight <= 35) {
      return "5";
    } else if (weight >= 36) {
      return "6";
    } else {
      return "Error ";
    }
  }
}
