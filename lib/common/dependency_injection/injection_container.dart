import 'package:get_it/get_it.dart';
import 'package:work_trial/feature/country/data/data_sources/remote/country_list_remote_source.dart';
import 'package:work_trial/feature/country/data/repository/country_list_repository_impl.dart';
import 'package:work_trial/feature/country/domain/repository/country_list_repository.dart';
import 'package:work_trial/feature/country/domain/usecases/get_countries.dart';
import 'package:work_trial/feature/country/domain/usecases/get_country_details.dart';
import 'package:work_trial/feature/country/presentation/bloc/country_details/country_details_bloc.dart';
import 'package:work_trial/feature/country/presentation/bloc/country_list/country_list_bloc.dart';

final serviceLocator = GetIt.instance;

class DIContainer {
  static Future<void> initializeDependencies() async {
    // * Sources
    serviceLocator.registerSingleton<CountryListRemoteSource>(
      CountryListRemoteSource(),
    );

    // * Repositories
    serviceLocator.registerSingleton<CountryListRepository>(
      CountryListRepositoryImpl(
        serviceLocator(),
      ),
    );

    // * Blocs
    serviceLocator.registerFactory<CountryListBloc>(
      () => CountryListBloc(
        serviceLocator(),
      ),
    );

    serviceLocator.registerFactory<CountryDetailsBloc>(
      () => CountryDetailsBloc(
        serviceLocator(),
      ),
    );

    // * UseCases
    serviceLocator.registerSingleton<GetCountriesUseCase>(
      GetCountriesUseCase(
        serviceLocator(),
      ),
    );

    serviceLocator.registerSingleton<GetCountryDetailsUseCase>(
      GetCountryDetailsUseCase(
        serviceLocator(),
      ),
    );
  }
}
