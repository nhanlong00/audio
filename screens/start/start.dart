import 'package:firestore/import.dart';
import 'package:firestore/screens/home/page.dart';
import 'package:firestore/screens/login/page.dart';
import 'package:firestore/storage/storage.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (!empty(getUserAuth)) ? const HomePage() : const LoginPage(),
    );
  }
}
