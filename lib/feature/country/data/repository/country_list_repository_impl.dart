import 'package:graphql/client.dart';
import 'package:work_trial/feature/country/data/models/country_details_model.dart';
import '../../../../common/resources/data_state.dart';
import '../../domain/repository/country_list_repository.dart';
import '../data_sources/models/country_details_response_model/country_details_response_model.dart';
import '../data_sources/models/country_list_response_model/country_list_response_model.dart';
import '../data_sources/remote/country_list_remote_source.dart';
import '../models/country_model.dart';

class CountryListRepositoryImpl extends CountryListRepository {
  final CountryListRemoteSource _countryListRemoteSource;

  CountryListRepositoryImpl(this._countryListRemoteSource);

  @override
  Future<DataState<List<CountryModel>>> getCountryList() async {
    try {
      final result = await _countryListRemoteSource.fetchCountryList();

      if (!result.hasException) {
        CountryListResponseModel data =
            CountryListResponseModel.fromMap(result.data ?? {});

        List<CountryModel> countries = (data.countries ?? [])
            .map(
              (e) => CountryModel.fromResponseModel(e),
            )
            .toList();

        return DataSuccess(
          countries,
        );
      } else {
        return DataFailed(
          result.exception!,
        );
      }
    } catch (e) {
      return DataFailed(
        OperationException(),
      );
    }
  }

  @override
  Future<DataState<CountryDetailsModel>> getCountryDetails(
    String countryCode,
  ) async {
    try {
      final result =
          await _countryListRemoteSource.getCountryDetails(countryCode);

      if (!result.hasException) {
        CountryDetailsResponseModel data =
            CountryDetailsResponseModel.fromMap(result.data ?? {});

        CountryDetailsModel details =
            CountryDetailsModel.fromResponseModel(data.country!);

        return DataSuccess(
          details,
        );
      } else {
        return DataFailed(
          result.exception!,
        );
      }
    } catch (e) {
      return DataFailed(
        OperationException(),
      );
    }
  }
}
