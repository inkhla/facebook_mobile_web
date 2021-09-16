import 'package:cpc_task/layout/cubit/cubit.dart';
import 'package:cpc_task/layout/cubit/states.dart';
import 'package:cpc_task/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => FacebookCubit(),
      child:BlocConsumer<FacebookCubit,FacebookStates>(
        listener: (context,state) {},
        builder: (context,state){
          return const MaterialApp(
              debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
