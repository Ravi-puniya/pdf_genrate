import 'package:fetch_data/models/detailfetch.dart';
import 'package:fetch_data/screens/mainhome.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailFetch(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MainHome()),
    );
  }
}
