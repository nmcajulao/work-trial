import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_trial/feature/country/domain/entities/country_entity.dart';
import 'package:work_trial/feature/country/domain/usecases/get_countries.dart';

import '../../../../../common/resources/data_state.dart';

part 'country_list_event.dart';
part 'country_list_state.dart';

class CountryListBloc extends Bloc<CountryListEvent, CountryListState> {
  final GetCountriesUseCase _getCountriesUseCase;

  CountryListBloc(this._getCountriesUseCase) : super(const CountryListState()) {
    on<GetCountries>(_getCountries);
  }

  Future<void> _getCountries(
    GetCountries event,
    Emitter<CountryListState> emit,
  ) async {
    emit(const CountryListState(status: CountryListStatus.loading));

    final dataState = await _getCountriesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      List<CountryEntity> countries = dataState.data ?? [];

      emit(
        CountryListState(
          status: CountryListStatus.loaded,
          countries: countries,
        ),
      );
    } else if (dataState is DataFailed) {
      emit(
        const CountryListState(
          status: CountryListStatus.error,
        ),
      );
    }
  }
}
