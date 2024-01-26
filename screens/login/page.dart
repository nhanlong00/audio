import 'package:firestore/import.dart';
import 'package:firestore/screens/login/widgets/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Login(),
        ),
      ),
    );
  }
}
