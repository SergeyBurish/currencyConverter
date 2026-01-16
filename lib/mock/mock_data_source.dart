import 'dart:convert';
import 'package:currency_converter/features/home/data/data_sources/remote_data_source.dart';
import 'package:currency_converter/features/home/data/dto/cbr_dto.dart';

class MockDataSource implements CurrencyRemoteDataSource {

  static const String mockJson = '''
{"Date":"2026-01-16T11:30:00+03:00",
"PreviousDate":"2026-01-15T11:30:00+03:00",
"PreviousURL":"\/\/www.cbr-xml-daily.ru\/archive\/2026\/01\/15\/daily_json.js",
"Timestamp":"2026-01-15T19:00:00+03:00",
"Valute":{
"BHD":{"ID":"R01080","NumCode":"048","CharCode":"BHD","Nominal":1,"Name":"Бахрейнский динар","Value":2.0,"Previous":2.0},
"HUF":{"ID":"R01135","NumCode":"348","CharCode":"HUF","Nominal":100,"Name":"Форинтов","Value":3.0,"Previous":3.0},
"VND":{"ID":"R01150","NumCode":"704","CharCode":"VND","Nominal":10000,"Name":"Донгов","Value":4.0,"Previous":4.0},
"HKD":{"ID":"R01200","NumCode":"344","CharCode":"HKD","Nominal":1,"Name":"Гонконгский доллар","Value":5.0,"Previous":5.0},
"GEL":{"ID":"R01210","NumCode":"981","CharCode":"GEL","Nominal":1,"Name":"Лари","Value":6.0,"Previous":6.0},
"MMK":{"ID":"R02005","NumCode":"104","CharCode":"MMK","Nominal":1000,"Name":"Кьятов","Value":7.0,"Previous":7.0}}}''';

  @override
  Future<CbrDto> getExchangeRates() async {
    return CbrDto.fromApi(json.decode(mockJson));
  }
}