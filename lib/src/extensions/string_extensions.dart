part of ethller_api_interface;

extension CustomStringExtensions on String {
  String truncateString(int length) {
    return (this.length >= length) ? '${this.substring(0, length)}...' : this;
  }
}
