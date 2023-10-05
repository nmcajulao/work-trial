// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CountryDetailsEntity {
  final String name;
  final String capital;
  final String emoji;
  final String currency;
  final List<String> languages;

  CountryDetailsEntity({
    required this.name,
    required this.capital,
    required this.emoji,
    required this.currency,
    required this.languages,
  });

  CountryDetailsEntity copyWith({
    String? name,
    String? capital,
    String? emoji,
    String? currency,
    List<String>? languages,
  }) {
    return CountryDetailsEntity(
      name: name ?? this.name,
      capital: capital ?? this.capital,
      emoji: emoji ?? this.emoji,
      currency: currency ?? this.currency,
      languages: languages ?? this.languages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'capital': capital,
      'emoji': emoji,
      'currency': currency,
      'languages': languages,
    };
  }

  factory CountryDetailsEntity.fromMap(Map<String, dynamic> map) {
    return CountryDetailsEntity(
      name: map['name'] as String,
      capital: map['capital'] as String,
      emoji: map['emoji'] as String,
      currency: map['currency'] as String,
      languages: List<String>.from(
        (map['languages'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryDetailsEntity.fromJson(String source) =>
      CountryDetailsEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryDetailsEntity(name: $name, capital: $capital, emoji: $emoji, currency: $currency, languages: $languages)';
  }

  @override
  bool operator ==(covariant CountryDetailsEntity other) {
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
