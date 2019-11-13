import 'package:flutter/material.dart';



void main() {
  for (int i = 1; i < 1000; i += 2) {
    final line = (i / 2 + 0.5).round();
  }


  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ListView.builder(itemBuilder: (context, index) {
            if (index.isOdd) return Divider();
            return Text('Строка ${index / 2 + 1}');
          }),
        )),
  );
}
