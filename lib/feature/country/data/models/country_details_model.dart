// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:work_trial/feature/country/domain/entities/country_details_entity.dart';

import '../data_sources/models/country_details_response_model/country.dart';

class CountryDetailsModel extends CountryDetailsEntity {
  CountryDetailsModel({
    required super.name,
    required super.capital,
    required super.emoji,
    required super.currency,
    required super.languages,
  });

  @override
  CountryDetailsModel copyWith({
    String? name,
    String? capital,
    String? emoji,
    String? currency,
    List<String>? languages,
  }) {
    return CountryDetailsModel(
      name: name ?? this.name,
      capital: capital ?? this.capital,
      emoji: emoji ?? this.emoji,
      currency: currency ?? this.currency,
      languages: languages ?? this.languages,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'capital': capital,
      'emoji': emoji,
      'currency': currency,
      'languages': languages,
    };
  }

  factory CountryDetailsModel.fromMap(Map<String, dynamic> map) {
    return CountryDetailsModel(
      name: map['name'] as String,
      capital: map['capital'] as String,
      emoji: map['emoji'] as String,
      currency: map['currency'] as String,
      languages: List<String>.from(
        (map['languages'] as List<String>),
      ),
    );
  }

  factory CountryDetailsModel.fromResponseModel(
      CountryInnerDetailsResponseModel model) {
    return CountryDetailsModel(
      name: model.name ?? '',
      capital: model.capital ?? '',
      emoji: model.emoji ?? '',
      currency: model.currency ?? '',
      languages: (model.languages ?? []).map((e) => e.name ?? '').toList(),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory CountryDetailsModel.fromJson(String source) =>
      CountryDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryDetailsModel(name: $name, capital: $capital, emoji: $emoji, currency: $currency, languages: $languages)';
  }

  @override
  bool operator ==(covariant CountryDetailsModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.capital == capital &&
        other.emoji == emoji &&
        other.currency == currency &&
        listEquals(other.languages, languages);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        capital.hashCode ^
        emoji.hashCode ^
        currency.hashCode ^
        languages.hashCode;
  }
}
