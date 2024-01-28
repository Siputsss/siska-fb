part of '_index.dart';

final loginData = RM.inject(() => LoginData());

class LoginData {
  final rxUser = RM.injectStream<User?>(
    () => Stream.value(null),
  );

  Route list = MaterialPageRoute(builder: (context) => const ProductListView());
  Route login = MaterialPageRoute(builder: (context) => const LoginView());
}
