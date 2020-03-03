import 'package:flutter/cupertino.dart';
import 'package:sample_flutter/services/webservice.dart';
import 'country_view_model.dart';

class CountryListViewModel extends ChangeNotifier {

  List<CountryViewModel> countries = List<CountryViewModel>();

  Future<void> fetchCountries(String keyword) async {
    final results =  await Webservice().fetchCountries(keyword);
    this.countries = results.map((item) => CountryViewModel(country: item)).toList();
    print(this.countries);
    notifyListeners(); 
  }

}