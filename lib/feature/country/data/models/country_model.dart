// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:work_trial/feature/country/domain/entities/country_entity.dart';

import '../data_sources/models/country_list_response_model/country.dart';

class CountryModel extends CountryEntity {
  CountryModel({
    required super.code,
    required super.name,
    required super.emoji,
    required super.capital,
    required super.languages,
  });

  @override
  CountryModel copyWith({
    String? code,
    String? name,
    String? emoji,
    String? capital,
    List<String>? languages,
  }) {
    return CountryModel(
      code: code ?? this.code,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      capital: capital ?? this.capital,
      languages: languages ?? this.languages,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'emoji': emoji,
      'capital': capital,
      'languages': languages,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      code: map['code'] as String,
      name: map['name'] as String,
      emoji: map['emoji'] as String,
      capital: map['capital'] as String,
      languages: List<String>.from(
        (map['languages'] as List<String>),
      ),
    );
  }

  factory CountryModel.fromResponseModel(CountryListModel model) {
    return CountryModel(
      code: model.code ?? '',
      name: model.name ?? '',
      emoji: model.emoji ?? '',
      capital: model.capital ?? '',
      languages: (model.languages ?? []).map((e) => e.name ?? '').toList(),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryModel(code: $code, name: $name, emoji: $emoji, capital: $capital, languages: $languages)';
  }

  @override
  bool operator ==(covariant CountryModel other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.name == name &&
        other.emoji == emoji &&
        other.capital == capital &&
        listEquals(other.languages, languages);
  }

  @override
  int get hashCode {
    return code.hashCode ^ name.hashCode ^ emoji.hashCode ^ languages.hashCode;
  }
}
