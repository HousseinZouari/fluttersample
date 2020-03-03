import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter/pages/country_list_page.dart';
import 'package:sample_flutter/viewModels/country_list_view_model.dart';

void main() => runApp(App());
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies",
        home:
        ChangeNotifierProvider(
          create: (context) => CountryListViewModel(),
          child: CountryListPage(),
        )
    );
  }

}
