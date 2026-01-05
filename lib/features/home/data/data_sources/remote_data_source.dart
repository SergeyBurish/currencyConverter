import 'dart:convert';

import 'package:currency_converter/features/home/data/dto/cbr_dto.dart';
import 'package:dio/dio.dart';

abstract interface class CurrencyRemoteDataSource {
  Future<CbrDto> getExchangeRates();
}

class CurrencyRemoteDataSourceImp implements CurrencyRemoteDataSource {
  static const _baseUrl = 'https://www.cbr-xml-daily.ru/daily_json.js';
  final Dio _dio = Dio();

  @override
  Future<CbrDto> getExchangeRates() async {
    final response = await _dio.get(_baseUrl);
    return CbrDto.fromApi(json.decode(response.data));
  }
}