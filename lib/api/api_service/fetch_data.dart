import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/image_modal.dart';

class Repository{
  Future<ImageDataFromPexel?> fetchData() async{
    Uri uri = Uri.parse("https://api.pexels.com/v1/search?query=people");
    http.Response response = await http.get(uri, headers: {
      'Authorization' : 'J8IFcjRx2YkaF5I6awZ871wvgEJ342sUUhxatbVZVEcJZpUJvPtdp6P8',
    });

    if(response.statusCode == 200){
     var data = jsonDecode(response.body);
     return ImageDataFromPexel.fromJson(data);
    }else{
      print("Status code is not 200");
    }
  }
}