import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodieapp/ApiDemo/model_class.dart';
import 'package:foodieapp/ApiDemo/reposit.dart';

part 'api_demo_event.dart';
part 'api_demo_state.dart';

class ApiDemoBloc extends Bloc<ApiDemoEvent, ApiDemoState> {
  ApiDemoBloc() : super(const ApiDemoInitial(isApiLoading: false)) {
    on<FetchData>((event, emit) async{
      emit(const ApiDemoState(isApiLoading: true));
      final DataModel dataModel=await DataRepository().demoUser() ;
      //  print(dataModel.data[0].firstName);
      emit(ApiDemoState(isApiLoading: false,result: dataModel));
        // print(state.result!.page);
 
    
      

    });
  }
}
