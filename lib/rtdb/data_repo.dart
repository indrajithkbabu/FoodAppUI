// // ignore_for_file: camel_case_types, strict_raw_type

// import 'dart:convert';

// import 'package:foodieapp/rtdb/data_model.dart';
// import 'package:http/http.dart';


// class rtdbRepository{
// String endpoint =
//       'https://food-delivery-app-5ff8c-default-rtdb.firebaseio.com/posthome.json';

//       Future rtdbUser()async{
//         final response =await get(Uri.parse(endpoint));
      
//           if(response.statusCode==200 || response.statusCode==201){
//             return RtdbDemoModel.fromJson(
//                json.decode(response.body) as Map<String, dynamic>,
//             );

//           }else {
//       // print('errrr');
//       throw Exception(response.reasonPhrase);
//     }
        
//       }
// }
