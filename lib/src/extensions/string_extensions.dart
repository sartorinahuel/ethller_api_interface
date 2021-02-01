part of ethller_api_interface;

extension CustomStringExtensions on String {
  double toDoubleFromBigInt() {
    if (this == '0') {
      return 0.0;
    } else {
      if (length > 17) {
        final restLength = substring(17).length;
        final divider = 1000000000000000000 / (pow(10, restLength));
        final stringValue = substring(0, 17);
        final value = int.parse(stringValue);
        return value / divider;
      } else {
        final value = int.parse(this);
        final divider = 1000000000000000000;
        return value / divider;
      }
    }
  }
}
