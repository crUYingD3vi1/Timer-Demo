import 'package:flutter/material.dart';
import 'dart:math';

final random = Random();

class MainScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главное окно')),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Открыть второе окно'),
              onPressed: () {
                final number = random.nextInt(100);
                print('Кнопка нажата');
                Navigator.pushNamed(
                  context,
                  '/second/$number',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  String _id;

  SecondScreen({String id}) : _id = id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Случайное число $_id')),
      body: Center(
        child: RaisedButton(
          child: Text('Назад'),
          onPressed: () {
            Navigator.push(
                context,
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, _, __) => MyPopup(),
              )
            );
          },
        ),
      ),
    );
  }
}

class MyPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Всё здорово'),
      actions: [
        FlatButton(child: Text('Кнопка 1')),
        FlatButton(child: Text('Кнопка
  }
}

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/second': (context) => SecondScreen(),
      },
      onGenerateRoute: (routeSettings) {
        final route = routeSettings.name;
        final path = route.split('/');
        if (path[1] == 'second') {
          return MaterialPageRoute(
            builder: (context) => SecondScreen(id: path[2]),
            settings: routeSettings,
          );
        }
        return null;
      },
    ));
