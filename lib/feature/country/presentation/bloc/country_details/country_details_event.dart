part of 'country_details_bloc.dart';

sealed class CountryDetailsEvent extends Equatable {
  const CountryDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetCountryDetails extends CountryDetailsEvent {
  final CountryEntity selectedCountry;

  const GetCountryDetails({required this.selectedCountry});

  @override
  List<Object> get props => [selectedCountry];
}
