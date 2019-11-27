import 'package:http/http.dart' as http;

void getRequest () {
  http.get('https://json.flutter.su/echo').then((response) {
    print('Код ответа: ${response.statusCode}');
    print('Тело ответа: ${response.body}');
  }).catchError((error) {
    print('Возникла ошибка: $error');
  });
}

void postRequest() async {
  var response = await http.post(
      'https://json.flutter.su/echo',
  body: {
        'name': 'Жмышенко Валерий Альбертович',
        'age': 69.toString(),
   },
    headers: {
        'Accept': 'application/json',
    },
  );
  print('Код ответа: ${response.statusCode}');
  print('Тело ответа: ${response.body}');
}

void main() {
  getRequest();
  postRequest();
  print('Окончание функции main');
}