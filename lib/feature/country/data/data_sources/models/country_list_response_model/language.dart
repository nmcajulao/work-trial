// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CountryListLanguageModel {
  final String? name;

  CountryListLanguageModel({
    this.name,
  });

  CountryListLanguageModel copyWith({
    String? name,
  }) {
    return CountryListLanguageModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory CountryListLanguageModel.fromMap(Map<String, dynamic> map) {
    return CountryListLanguageModel(
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryListLanguageModel.fromJson(String source) =>
      CountryListLanguageModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Language(name: $name)';

  @override
  bool operator ==(covariant CountryListLanguageModel other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
