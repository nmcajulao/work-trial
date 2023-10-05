import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'language.dart';

class CountryInnerDetailsResponseModel extends Equatable {
  final String? typename;
  final String? name;
  final String? capital;
  final String? emoji;
  final String? currency;
  final List<CountryDetailsLanguageModel>? languages;

  const CountryInnerDetailsResponseModel({
    this.typename,
    this.name,
    this.capital,
    this.emoji,
    this.currency,
    this.languages,
  });

  factory CountryInnerDetailsResponseModel.fromMap(Map<String, dynamic> data) =>
      CountryInnerDetailsResponseModel(
        typename: data['__typename'] as String?,
        name: data['name'] as String?,
        capital: data['capital'] as String?,
        emoji: data['emoji'] as String?,
        currency: data['currency'] as String?,
        languages: (data['languages'] as List<dynamic>?)
            ?.map((e) =>
                CountryDetailsLanguageModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        '__typename': typename,
        'name': name,
        'capital': capital,
        'emoji': emoji,
        'currency': currency,
        'languages': languages?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CountryInnerDetailsResponseModel].
  factory CountryInnerDetailsResponseModel.fromJson(String data) {
    return CountryInnerDetailsResponseModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CountryInnerDetailsResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CountryInnerDetailsResponseModel copyWith({
    String? typename,
    String? name,
    String? capital,
    String? emoji,
    String? currency,
    List<CountryDetailsLanguageModel>? languages,
  }) {
    return CountryInnerDetailsResponseModel(
      typename: typename ?? this.typename,
      name: name ?? this.name,
      capital: capital ?? this.capital,
      emoji: emoji ?? this.emoji,
      currency: currency ?? this.currency,
      languages: languages ?? this.languages,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      typename,
      name,
      capital,
      emoji,
      currency,
      languages,
    ];
  }
}
