import 'package:adham_tasks/Shared/AppCubit/app_cubit.dart';
import 'package:adham_tasks/Shared/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Shared/bloc_observer.dart';
import 'Task2/SportLayout.dart';

void main() {
   DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

const primaryColor = Colors.white;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()..showVideos()..getSportsData()..getGridviewSportsData()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize:const Size(375,812),
        builder: () {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tasks',
            theme: ThemeData(
                primaryColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Color(0xff2C2B53),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white,
                )
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );

        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdhamTasks App '),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LayoutScreen()));
                },
                child: Text(
                  'Go to Task',
                  style: TextStyle(fontSize: 25, color: Colors.black87),
                )),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
