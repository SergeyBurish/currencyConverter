
class CurrencyEntity {
  final String name;
  final String charCode;
  final String countryCode;
  final double rate;

  CurrencyEntity({required this.name, required this.charCode, required this.rate}):
    countryCode = charCode.substring(0, 2); // TODO: handle exceptions
}