import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'language.dart';

class CountryListModel extends Equatable {
  final String? code;
  final String? name;
  final String? emoji;
  final String? capital;
  final List<CountryListLanguageModel>? languages;

  const CountryListModel(
      {this.code, this.name, this.emoji, this.capital, this.languages});

  factory CountryListModel.fromMap(Map<String, dynamic> data) =>
      CountryListModel(
        code: data['code'] as String?,
        name: data['name'] as String?,
        emoji: data['emoji'] as String?,
        capital: data['capital'] as String?,
        languages: (data['languages'] as List<dynamic>?)
            ?.map((e) =>
                CountryListLanguageModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'code': code,
        'name': name,
        'emoji': emoji,
        'capital': capital,
        'languages': languages?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CountryListModel].
  factory CountryListModel.fromJson(String data) {
    return CountryListModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CountryListModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CountryListModel copyWith({
    String? code,
    String? name,
    String? emoji,
    String? capital,
    List<CountryListLanguageModel>? languages,
  }) {
    return CountryListModel(
      code: code ?? this.code,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      capital: capital ?? this.capital,
      languages: languages ?? this.languages,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, name, emoji, capital, languages];
}
