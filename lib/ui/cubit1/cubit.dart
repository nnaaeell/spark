import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/ui/Cubit1/states.dart';

class Cubit1 extends Cubit<Cubit1States>{
  Cubit1() : super(InitialCubit1State());


  static Cubit1 get(context) => BlocProvider.of(context);




}