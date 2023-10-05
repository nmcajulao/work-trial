// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CountryEntity {
  final String code;
  final String name;
  final String emoji;
  final String capital;
  final List<String> languages;

  CountryEntity({
    required this.code,
    required this.name,
    required this.emoji,
    required this.capital,
    required this.languages,
  });

  CountryEntity copyWith({
    String? code,
    String? name,
    String? emoji,
    String? capital,
    List<String>? languages,
  }) {
    return CountryEntity(
      code: code ?? this.code,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      capital: capital ?? this.capital,
      languages: languages ?? this.languages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'emoji': emoji,
      'capital': capital,
      'languages': languages,
    };
  }

  factory CountryEntity.fromMap(Map<String, dynamic> map) {
    return CountryEntity(
      code: map['code'] as String,
      name: map['name'] as String,
      emoji: map['emoji'] as String,
      capital: map['capital'] as String,
      languages: List<String>.from(
        (map['languages'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryEntity.fromJson(String source) =>
      CountryEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryEntity(code: $code, name: $name, emoji: $emoji, capital: $capital, languages: $languages)';
  }

  @override
  bool operator ==(covariant CountryEntity other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.name == name &&
        other.emoji == emoji &&
        other.capital == capital &&
        listEquals(other.languages, languages);
  }

  @override
  int get hashCode {
    return code.hashCode ^
        name.hashCode ^
        emoji.hashCode ^
        capital.hashCode ^
        languages.hashCode;
  }
}
