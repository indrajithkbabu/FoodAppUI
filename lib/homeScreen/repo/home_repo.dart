import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/utils/sharedpref.dart';
import 'package:http/http.dart';

class ApiHomeRepo{

String homeUrl='https://food-delivery-rv21.onrender.com/api/home';

Future<HomeApiModel> apiHomeInn()async{
  // print('apirepo');
  final String? token=await getToken();
// print('gottoken');
    final response =await get(Uri.parse(homeUrl),headers: {
      'Authorization':'Bearer $token',
      // "Content-Type": 'application/json'
    },);
 
    if(response.statusCode==200 || response.statusCode==201){
      // print(response.body);
      //  print("google response");
      return homeApiModelFromJson(response.body);
    } else{
      //  print('errrr');
      throw Exception(response.statusCode);
    }

}

}
