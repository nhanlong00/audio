import 'package:firestore/import.dart';
import 'package:firestore/screens/audio_player/widgets/page.dart';

class AudioPlayer extends StatelessWidget {
  const AudioPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AudioPage(),
      ),
    );
  }
}
