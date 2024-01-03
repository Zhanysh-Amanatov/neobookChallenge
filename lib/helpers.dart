// remove zeros after dot
String removeTrailingZeros(String price) {
  double parsedPrice = double.tryParse(price) ?? 0;
  String formattedPrice = parsedPrice.toString();

  if (formattedPrice.contains('.')) {
    formattedPrice = formattedPrice.replaceAll(RegExp(r'0*$'), '');
    formattedPrice = formattedPrice.replaceAll(RegExp(r'\.$'), '');
  }
  return formattedPrice;
}
