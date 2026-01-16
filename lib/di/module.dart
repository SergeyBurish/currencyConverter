import 'package:currency_converter/app/app_config.dart';
import 'package:currency_converter/features/home/data/data_sources/local_data_source.dart';
import 'package:currency_converter/features/home/data/data_sources/remote_data_source.dart';
import 'package:currency_converter/features/home/data/repository/currency_repository.dart';
import 'package:currency_converter/features/home/domain/repository/currency_repository.dart';
import 'package:currency_converter/features/home/domain/usecase/home_usecase.dart';
import 'package:currency_converter/mock/mock_data_source.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Module{
  @lazySingleton
  CurrencyRemoteDataSource remoteDataSource() => AppConfig.useMockApi ?
      MockDataSource() : CurrencyRemoteDataSourceImp();

  @lazySingleton
  CurrencyLocalDataSource localDataSource() =>
      CurrencyLocalDataSourceImp();

  @lazySingleton
  CurrencyRepository currencyRepository(
    CurrencyRemoteDataSource remoteDataSource,
    CurrencyLocalDataSource localDataSource) =>
      CurrencyRepositoryImp(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource);

  @lazySingleton
  CurrencyProducer currencyProducer(CurrencyRepository repository) =>
      CurrencyUsecase(repository: repository);
}