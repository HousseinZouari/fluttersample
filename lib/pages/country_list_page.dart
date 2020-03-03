import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter/viewModels/country_list_view_model.dart';
import 'package:sample_flutter/widgets/country_list.dart';

class CountryListPage extends StatefulWidget {
  @override
  _CountryListPage createState() => _CountryListPage();
}

class _CountryListPage extends State<CountryListPage> {

  final TextEditingController _controller = TextEditingController(); 

  @override
  void initState() {
    super.initState();
    Provider.of<CountryListViewModel>(context, listen: false).fetchCountries("batman");
  }

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<CountryListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Countries")
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey, 
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                  vm.fetchCountries(value);
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search", 
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none
              ),

            ),
          ), 
          Expanded(
            child: CountryList(countries: vm.countries,
          ))
        ])
      )
   
    );
  }
}