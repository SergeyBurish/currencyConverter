
class CurrencyEntity {
  final String name;
  final String charCode;
  final String countryCode;
  final String toRUR;
  final String fromRUR;
  final double rate;

  CurrencyEntity({required this.name, required this.charCode, required this.rate}):
    countryCode = charCode.substring(0, 2),
    toRUR = "1 $charCode = ??? RUR",
    fromRUR = "1 RUR = ??? $charCode";
}