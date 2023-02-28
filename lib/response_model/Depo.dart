class Depo{
  final String name;
  Depo({this.name=""});
  factory Depo.fromJson(Map<String, dynamic> parsedJson){
    return Depo(
        //name: parsedJson['dame']

    );
  }
}