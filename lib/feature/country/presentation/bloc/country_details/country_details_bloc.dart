import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_trial/feature/country/domain/entities/country_details_entity.dart';
import 'package:work_trial/feature/country/domain/entities/country_entity.dart';

import '../../../../../common/resources/data_state.dart';
import '../../../domain/usecases/get_country_details.dart';

part 'country_details_event.dart';
part 'country_details_state.dart';

class CountryDetailsBloc
    extends Bloc<CountryDetailsEvent, CountryDetailsState> {
  final GetCountryDetailsUseCase _getCountryDetailsUseCase;

  CountryDetailsBloc(this._getCountryDetailsUseCase)
      : super(const CountryDetailsState()) {
    on<GetCountryDetails>(_getCountryDetails);
  }

  Future<void> _getCountryDetails(
    GetCountryDetails event,
    Emitter<CountryDetailsState> emit,
  ) async {
    emit(const CountryDetailsState(status: CountryDetailsStatus.loading));

    final dataState = await _getCountryDetailsUseCase(
      params: event.selectedCountry.code,
    );

    final data = dataState.data;

    if (dataState is DataSuccess && data != null) {
      CountryDetailsEntity countryDetails = data;

      emit(
        CountryDetailsState(
          status: CountryDetailsStatus.loaded,
          selectedCountry: event.selectedCountry,
          countryDetails: countryDetails,
        ),
      );
    } else if (dataState is DataFailed) {
      emit(
        const CountryDetailsState(
          status: CountryDetailsStatus.error,
        ),
      );
    }
  }
}
