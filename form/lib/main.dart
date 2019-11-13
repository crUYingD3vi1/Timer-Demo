import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(10),
        child:  Column(
        children: [
          Text(
              'Введите имя пользователя:',
                  style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            validator: (value) {
              if(value.isEmpty) return 'Имя не может быть пустым';
              return null;
            },
          ),
          SizedBox(height: 20),
          Text(
              'Введите e-mail пользователя',
              style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) return 'E-mail не может быть пустым';
              if (!value.contains('@')) return 'Поле e-mail должно содержать"@"';
              String p ='[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+';
              RegExp regExp = RegExp(p);
              if (regExp.hasMatch(value)) return null;
              return 'Неправильный e-mail';
            },
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text('Отправить данные'),
            color: Colors.deepOrange,
            textColor: Colors.white,
            onPressed: () {
              if(_formKey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Форма прошла проверку'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
          ),
        ],
      ),),

    );
  }
}

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text('Пример формы ввода')),
      body: MyForm(),
    )));
