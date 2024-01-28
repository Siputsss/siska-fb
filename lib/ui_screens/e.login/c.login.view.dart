part of '_index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: OnBuilder.data(
        listenTo: dt.rxUser,
        builder: (data) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await ct.signInAnonymous();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(context, dt.rxUser.state != null ? dt.list : dt.login);
                },
                child: const Text(
                  "Login Anonymous",
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await ct.signInByGoogle();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(context, dt.rxUser.state != null ? dt.list : dt.login);
                },
                child: const Text(
                  "Login by Google",
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
