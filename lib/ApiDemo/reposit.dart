import 'package:foodieapp/ApiDemo/model_class.dart';
import 'package:http/http.dart';

class DataRepository{
  String endpoint='https://reqres.in/api/users?page=2';
 Future <DataModel> demoUser()async{
    final response =await get(Uri.parse(endpoint));
    if(response.statusCode==200 || response.statusCode==201){
          //  print(response.body);
      return dataModelFromJson(response.body);
   
  


    }
    else{
      // print('errrr');
      throw Exception(response.reasonPhrase);
    }
  }
}
