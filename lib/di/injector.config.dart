// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/home/domain/usecase/home_usecase.dart' as _i951;
import 'module.dart' as _i946;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final module = _$Module();
    gh.lazySingleton<_i951.CurrencyRepository>(() => module.remoteDataSource());
    gh.lazySingleton<_i951.CurrencyProducer>(
        () => module.currencyProducer(gh<_i951.CurrencyRepository>()));
    return this;
  }
}

class _$Module extends _i946.Module {}
