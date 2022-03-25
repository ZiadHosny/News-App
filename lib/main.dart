// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/mode_cubit.dart';
import 'package:news_app/cubit/mode_state.dart';

import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool? isDark = prefs.getBool('MODE');

  runApp(MyApp( isDark : isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({Key? key, required  this.isDark}) : super(key: key);
    @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ModeCubit()..changeTheme(fromShared: isDark),
      child: BlocConsumer<ModeCubit, ModeState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          title: 'News App',
          debugShowCheckedModeBanner: false,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: 
              ModeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
