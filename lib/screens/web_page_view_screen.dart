// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
