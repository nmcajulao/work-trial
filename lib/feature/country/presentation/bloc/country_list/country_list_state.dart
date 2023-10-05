// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'country_list_bloc.dart';

class CountryListState extends Equatable {
  /// country list state status
  final CountryListStatus status;

  /// graph ql fetched countries turned into a class/model
  final List<CountryEntity> countries;

  const CountryListState({
    this.status = CountryListStatus.initial,
    this.countries = const [],
  });

  @override
  List<Object> get props => [
        status,
        countries,
      ];

  CountryListState copyWith({
    CountryListStatus? status,
    List<CountryEntity>? countries,
  }) {
    return CountryListState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
    );
  }
}

enum CountryListStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == CountryListStatus.initial;
  bool get isLoading => this == CountryListStatus.loading;
  bool get isLoaded => this == CountryListStatus.loaded;
  bool get isError => this == CountryListStatus.error;
}
