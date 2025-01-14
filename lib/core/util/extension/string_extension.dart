extension StringExtension on String {
  String createMask(int visibleLength) {
    if (isEmpty) return '';
    int maskLength = length - visibleLength;
    return substring(maskLength) + '*' * maskLength;
  }
}
