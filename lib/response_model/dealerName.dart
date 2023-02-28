class Dealer{
  final String name;
  Dealer({this.name=""});
  factory Dealer.fromJson(Map<String, dynamic> parsedJson){
    return Dealer(
        name: parsedJson['name']
    );
  }
}