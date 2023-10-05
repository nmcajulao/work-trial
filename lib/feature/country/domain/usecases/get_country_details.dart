import '../../../../common/resources/data_state.dart';
import '../../../../common/usecase/usecase.dart';
import '../entities/country_details_entity.dart';
import '../repository/country_list_repository.dart';

class GetCountryDetailsUseCase
    implements UseCase<DataState<CountryDetailsEntity>, String> {
  final CountryListRepository repository;

  GetCountryDetailsUseCase(this.repository);

  @override
  Future<DataState<CountryDetailsEntity>> call({String params = ''}) {
    return repository.getCountryDetails(params);
  }
}
