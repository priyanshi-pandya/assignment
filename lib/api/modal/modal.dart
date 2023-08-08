class CountryState{
  int id;
  String name;

  CountryState(this.id, this.name);

  @override
  String toString() {
    return 'index : $id, State name : $name';
  }
}


class Country{
  int id;
  String name;

  Country(this.id, this.name);

  @override
  String toString() {
    return name;
  }
}

List<CountryState> countriesStates = [
  CountryState(1, "California"),
  CountryState(1, "Texas"),
  CountryState(1, "Florida"),
  CountryState(1, "Ohio"),
  CountryState(1, "Washington"),
  CountryState(2, "Gujarat"),
  CountryState(2, "Maharashtra"),
  CountryState(2, "Karnataka"),
  CountryState(2, "Goa"),
];

List<Country> countries = [
  Country(1, 'India'),
  Country(2, 'USA')
];

