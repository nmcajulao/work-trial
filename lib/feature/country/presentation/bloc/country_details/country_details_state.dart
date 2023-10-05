// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'country_details_bloc.dart';

class CountryDetailsState extends Equatable {
  /// country details state status
  final CountryDetailsStatus status;

  /// selected country to fetch detail from
  final CountryEntity? selectedCountry;

  /// graph ql fetched countries turned into a class/model
  final CountryDetailsEntity? countryDetails;

  const CountryDetailsState({
    this.status = CountryDetailsStatus.initial,
    this.selectedCountry,
    this.countryDetails,
  });

  @override
  List<Object> get props => [
        status,
      ];

  CountryDetailsState copyWith({
    CountryDetailsStatus? status,
    CountryEntity? selectedCountry,
    CountryDetailsEntity? countryDetails,
  }) {
    return CountryDetailsState(
      status: status ?? this.status,
      selectedCountry: selectedCountry ?? selectedCountry,
      countryDetails: countryDetails ?? countryDetails,
    );
  }
}

enum CountryDetailsStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == CountryDetailsStatus.initial;
  bool get isLoading => this == CountryDetailsStatus.loading;
  bool get isLoaded => this == CountryDetailsStatus.loaded;
  bool get isError => this == CountryDetailsStatus.error;
}
