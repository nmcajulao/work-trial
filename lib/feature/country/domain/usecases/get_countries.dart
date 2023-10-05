import 'package:work_trial/feature/country/domain/entities/country_entity.dart';

import '../../../../common/resources/data_state.dart';
import '../../../../common/usecase/usecase.dart';
import '../repository/country_list_repository.dart';

class GetCountriesUseCase
    implements UseCase<DataState<List<CountryEntity>>, void> {
  final CountryListRepository repository;

  GetCountriesUseCase(this.repository);

  @override
  Future<DataState<List<CountryEntity>>> call({void params}) {
    return repository.getCountryList();
  }
}
