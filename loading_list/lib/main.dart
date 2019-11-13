import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  @override
  MyBodyState createState() => MyBodyState();
}
class MyBodyState extends State<MyBody>{
  List<int> _array= [];
  Widget build(BuildContext context) {
    // TODO: implement createState
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return Divider();
      final index = i~/ 2;
      if (_array.length <= index){
        _array.addAll([
          pow(2, index + 1),
          pow(2, index + 2),
          pow(2, index + 3),
        ]);
      }
      final num = _array[index];
      return Text('Строка $num');
    });
  }
}


void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(
        child: MyBody()
      ),
    ),
  ),
);