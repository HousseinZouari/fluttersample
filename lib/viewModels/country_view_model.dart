import 'package:sample_flutter/models/country.dart';

class CountryViewModel {

  final Country country;

  CountryViewModel({this.country});

  String get name {
    return this.country.name;
  }

  String get alpha2Code {
    return this.country.alpha2Code;
  }

  String get capital {
    return this.country.capital;
  }

  String get flag {
    return this.country.flag;
  }

}