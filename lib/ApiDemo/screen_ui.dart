import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/ApiDemo/bloc/api_demo_bloc.dart';


class ScreenUi extends StatelessWidget {
  const ScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ApiDemoBloc>().add(FetchData());
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<ApiDemoBloc, ApiDemoState>(
        builder: (context, state) {
        //  DataRepository().demoUser();
          //  final  resData=state.result!.description;
    //  print(state.result);
       
          if(state.isApiLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            final res=state.result?.data ;
      //  print(res.banners[0].image);
      // print(state.result?.page??0);
              return Column(
                children: [
                  Expanded(
                    child: Center(
                              child: ListView.builder(
                       itemCount: res?.length?? 0,
                  
                    itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(res![index].firstName,
                          ),
                        ),
                       
                      ],
                    );
                              },),
                            ),
                  ),
                   Expanded(child: Text('${state.result?.page??0}'))
                ],
              );
          }
        
        },
      ),
    );
  }
}
