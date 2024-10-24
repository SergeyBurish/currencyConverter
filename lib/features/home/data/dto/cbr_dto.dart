class CurrencyDto { 
  final String? id;
  final String? numCode;
  final String? charCode;
  final int? nominal;
  final String? name;
  final double? value;
  final double? previous;

  CurrencyDto.fromApi(Map<String, dynamic> record) :
    id = record['ID'],
    numCode = record['NumCode'],
    charCode = record['CharCode'],
    nominal = record['Nominal'],
    name = record['Name'],
    value = record['Value'],
    previous = record['Previous'];
}

class CbrDto {
  final String? date;
  final String? previousDate;
  final String? previousURL;
  final String? timestamp;
  List<CurrencyDto> currencies = [];

  CbrDto.fromApi(Map<String, dynamic> record) : 
    date =          record['Date'],
    previousDate =  record['PreviousDate'],
    previousURL = record['PreviousURL'],
    timestamp =  record['Timestamp'] {

    final Map<String, dynamic> valutes = record['Valute'];

    for(final valute in valutes.values){
      currencies.add(CurrencyDto.fromApi(valute));
    }
  }
}