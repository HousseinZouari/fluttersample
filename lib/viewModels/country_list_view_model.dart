import 'package:flutter/cupertino.dart';
import 'package:sample_flutter/services/webservice.dart';
import 'country_view_model.dart';

class CountryListViewModel extends ChangeNotifier {

  List<CountryViewModel> countries = List<CountryViewModel>(),
      allCountries = List<CountryViewModel>();

  Future<void> fetchCountries(String keyword) async {
      if (allCountries.length == 0) {
        final results = await Webservice().fetchCountries(keyword);
        this.countries =
            results.map((item) => CountryViewModel(country: item)).toList();
        this.allCountries = this.countries;
      } else {
        this.countries = keyword.isEmpty ? this.allCountries : getCountriesByKeyWord(keyword);
      }
      notifyListeners();
  }

  List<CountryViewModel> getCountriesByKeyWord(String keyword) {
    if (keyword.isEmpty) {
      return this.allCountries;
    } else {
      return this.allCountries.where((i) => i.name.indexOf(keyword) > -1 ).toList();
    }
  }

}