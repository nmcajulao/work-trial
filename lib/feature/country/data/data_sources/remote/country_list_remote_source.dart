import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:work_trial/common/client/graphql_client.dart';

import 'country_list_remote_query.dart';

class CountryListRemoteSource {
  Future<QueryResult<Object?>> fetchCountryList() async {
    try {
      final options = QueryOptions(
        document: gql(CountryListRemoteQuery.listCountriesThatUseUSDQuery),
      );

      final result = await graphQLClient.query(options);

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<QueryResult<Object?>> getCountryDetails(String countryCode) async {
    try {
      final options = QueryOptions(
        document: gql(CountryListRemoteQuery.getCountryQuery),
        variables: {
          'code': countryCode,
        },
      );

      final result = await graphQLClient.query(options);

      if (result.hasException) {
        debugPrint(result.exception.toString());
      }

      debugPrint("COUNTRY DETAILS: ${jsonEncode(result.data)}");

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
