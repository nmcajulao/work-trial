import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'country.dart';

class CountryListResponseModel extends Equatable {
  final List<CountryListModel>? countries;

  const CountryListResponseModel({this.countries});

  factory CountryListResponseModel.fromMap(Map<String, dynamic> data) {
    return CountryListResponseModel(
      countries: (data['countries'] as List<dynamic>?)
          ?.map((e) => CountryListModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'countries': countries?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CountryListResponseModel].
  factory CountryListResponseModel.fromJson(String data) {
    return CountryListResponseModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CountryListResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CountryListResponseModel copyWith({
    List<CountryListModel>? countries,
  }) {
    return CountryListResponseModel(
      countries: countries ?? this.countries,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [countries];
}
