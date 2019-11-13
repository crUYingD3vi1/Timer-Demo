import 'package:flutter/material.dart';

class SandGlass {
  int _sand = 0;
  time() => _sand;
  Future tick() async {
    print('Начало tick()');
    _sand = 100;
    while (0 < --_sand) {
      print('tick() $_sand');
      final duration = Duration(milliseconds: 100);
      await Future.delayed(duration);
    }
    print('Окончание tick()');


  }
}

class MyApp extends StatefulWidget {
  createState() => MyAppState();
}

class MyAppState extends State {
  SandGlass clock = SandGlass();

  build(BuildContext context) {
    _redrawWidget();
    final time = clock.time();
    print(time);
    return Center(
      child: Text('Осталось ${clock.time()}')
    );
  }

  _redrawWidget() async {
    final time = clock.time();
    if (time() == 0) return;
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      print('redrawWidget() $time');
    });

  }


  void initState() {
    clock.tick();
    super.initState();
  }

}



void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: MyApp(),
    ),
  ),
);




