class Country {

  final String name;
  final String capital;
  final String alpha2Code;
  final String flag;

  Country({this.name, this.capital, this.alpha2Code, this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {

    Country s = Country(
      name: json["name"],
      capital: json["capital"],
      alpha2Code: json["alpha2Code"],
        flag : json["flag"]
    );
    return s;
  }

}