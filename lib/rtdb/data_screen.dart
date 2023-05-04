// // ignore_for_file: cast_nullable_to_non_nullable

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// import 'package:foodieapp/rtdb/data_model.dart';

// class DataScreen extends StatelessWidget {
//   DataScreen({super.key});

//   final ref = FirebaseDatabase.instance.ref('posthome/-NRaVoQE73hYhDhJpzUB');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: StreamBuilder(
//             stream: ref.onValue,
//             builder: (context, snapshot) {
//               if (snapshot.hasData &&
//                   !snapshot.hasError &&
//                   snapshot.data!.snapshot.value != null) {
//                     final snap = snapshot.data!.snapshot.value
//                                   as Map<Object?, Object?>;
//                                   //print(snap);
//                      final snapData=NRaVoQe73HYhDhJpzUb.fromJson(snap);
//                     //  print(snapData.hotelCount);
                                          
//                 return Column(
//                   children: [
//                     Text(snapData.hotelCount.toString(),
                  
//                   ),
//                 Expanded(
//                     child: ListView.builder(
//                       itemCount: snapData.xploreResto.length,
//                       itemBuilder: (context, index) {
//                       return Text(snapData.xploreResto[index].place);
//                     },),
//                   )
//                   ],
//                 );
//               }else{
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//             ),
//       ),
//     );
//   }
// }
