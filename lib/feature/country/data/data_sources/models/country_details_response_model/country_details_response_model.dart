import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'country.dart';

class CountryDetailsResponseModel extends Equatable {
  final String? typename;
  final CountryInnerDetailsResponseModel? country;

  const CountryDetailsResponseModel({this.typename, this.country});

  factory CountryDetailsResponseModel.fromMap(Map<String, dynamic> data) {
    return CountryDetailsResponseModel(
      typename: data['__typename'] as String?,
      country: data['country'] == null
          ? null
          : CountryInnerDetailsResponseModel.fromMap(
              data['country'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        '__typename': typename,
        'country': country?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CountryDetailsResponseModel].
  factory CountryDetailsResponseModel.fromJson(String data) {
    return CountryDetailsResponseModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CountryDetailsResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CountryDetailsResponseModel copyWith({
    String? typename,
    CountryInnerDetailsResponseModel? country,
  }) {
    return CountryDetailsResponseModel(
      typename: typename ?? this.typename,
      country: country ?? this.country,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [typename, country];
}
