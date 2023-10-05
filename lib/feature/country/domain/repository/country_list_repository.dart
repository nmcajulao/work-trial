import 'package:work_trial/feature/country/data/models/country_details_model.dart';

import '../../../../common/resources/data_state.dart';
import '../../data/models/country_model.dart';

abstract class CountryListRepository {
  Future<DataState<List<CountryModel>>> getCountryList();

  Future<DataState<CountryDetailsModel>> getCountryDetails(String countryCode);
}
