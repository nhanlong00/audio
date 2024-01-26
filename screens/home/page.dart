import 'package:firestore/import.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.isLoggedIn});

  final bool? isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ButtonPrimary(onPress: () {
            Get.toNamed('/audio_player');
          }, title: 'Audio'),
          h(24),
          ],
        ),
      ),
    );
  }
}
