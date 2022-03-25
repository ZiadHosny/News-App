// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/screens/web_page_view_screen.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<News> news = NewsCubit.get(context).allSciencesNews;

        return news.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: news.length,
                itemBuilder: ((ctx, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => WebViewScreen(
                                          url: news[index].url,
                                        ))));
                          },
                          leading: Container(
                            width: 120,
                            height: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(news[index].urlToImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            news[index].title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1
                          ),
                          subtitle: Text(
                            news[index].publishedAt,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.deepOrange,
                      ),
                    ],
                  );
                }),
              );
      },
    );
  }
}
