// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/mode_cubit.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/screens/search_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getNews('sports')
        ..getNews('business')
        ..getNews('science'),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => BlocProvider(
                              create: (context) => NewsCubit(),
                              child: const SearchScreen(),
                            )),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                   
                    ModeCubit.get(context).changeTheme();
                  },
                  icon: Icon(
                    Icons.brightness_2_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
