class CountryListRemoteQuery {
  static String listCountriesThatUseUSDQuery = r"""
    query ListCountriesThatUseUSD {
      countries(filter: { currency: { eq: "USD" } }) {
        code
        name
        emoji
        capital
        languages {
          name
        }
      }
    }
  """;

  static String getCountryQuery = r"""
    query GetCountry($code: ID!) {
      country(code: $code) {
        name
        capital
        emoji
        currency
        languages {
          name
        }
      }
    }
  """;
}
