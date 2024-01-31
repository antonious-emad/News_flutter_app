import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth/cubit/states.dart';
import 'package:http/http.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitState());
  
  static HomeCubit get(context)=>BlocProvider.of(context);
}