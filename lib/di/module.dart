import 'package:currency_converter/features/home/data/repository/currency_repository.dart';
import 'package:currency_converter/features/home/domain/usecase/home_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Module{
  @lazySingleton
  CurrencyRepository remoteDataSource() =>
      CurrencyRepositoryImp();

  @lazySingleton
  CurrencyProducer currencyProducer(CurrencyRepository repository) =>
      HomeUsecase(repository: repository);
}