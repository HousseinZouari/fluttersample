import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_flutter/viewModels/country_view_model.dart';

class CountryList extends StatelessWidget {

  final List<CountryViewModel> countries;

  CountryList({this.countries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.countries.length,
      itemBuilder: (context, index) {
        
        final country = this.countries[index];
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            child:SvgPicture.network(
              country.flag,
              placeholderBuilder: (BuildContext context) => Container(
              child: const CircularProgressIndicator()),
            ),
            height: 50,
            width: 100,
          ),
          title: Text(country.name),
          subtitle: Text(country.capital),
        );
      },
    );
  }
}