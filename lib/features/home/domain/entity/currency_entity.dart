class CurrencyEntity {
  final String name;
  final String charCode;
  final String countryCode;
  final double value;
  final int nominal;
  final String toRUR;
  final String fromRUR;

  CurrencyEntity({
    required this.name,
    required this.charCode,
    required this.value,
    required this.nominal,
  }):
    countryCode = charCode.substring(0, 2),
    toRUR = '$nominal $charCode = $value RUR',
    fromRUR = '1 RUR = ${(nominal.toDouble()/value).toStringAsFixed(6)} $charCode';
}