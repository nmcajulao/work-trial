import 'dart:convert';

import 'package:equatable/equatable.dart';

class CountryDetailsLanguageModel extends Equatable {
  final String? typename;
  final String? name;

  const CountryDetailsLanguageModel({this.typename, this.name});

  factory CountryDetailsLanguageModel.fromMap(Map<String, dynamic> data) =>
      CountryDetailsLanguageModel(
        typename: data['__typename'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        '__typename': typename,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CountryDetailsLanguageModel].
  factory CountryDetailsLanguageModel.fromJson(String data) {
    return CountryDetailsLanguageModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CountryDetailsLanguageModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CountryDetailsLanguageModel copyWith({
    String? typename,
    String? name,
  }) {
    return CountryDetailsLanguageModel(
      typename: typename ?? this.typename,
      name: name ?? this.name,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [typename, name];
}
