import 'package:firestore/import.dart';
import 'package:firestore/screens/audio_player/controller.dart';
import 'package:firestore/screens/audio_player/models/audio_models.dart';
import 'package:firestore/screens/audio_player/widgets/play_lists.dart';
import 'package:firestore/screens/audio_player/widgets/player_buttons.dart';
import 'package:just_audio/just_audio.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    player.setAudioSource(ConcatenatingAudioSource(
      children: [
        AudioSource.uri(
          Uri.parse(
              "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3"),
          tag: AudioModels(
            title: "Tristram",
            artwork: "https://i.pinimg.com/564x/26/2c/6e/262c6e8600aacb273e14aacf35a3914f.jpg",
          ),
        ),
        AudioSource.uri(
          Uri.parse(
              "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3"),
          tag: AudioModels(
            title: "Cerulean City",
            artwork:
            "https://i.pinimg.com/564x/26/2c/6e/262c6e8600aacb273e14aacf35a3914f.jpg",
          ),
        ),
        AudioSource.uri(
          Uri.parse(
              "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3"),
          tag: AudioModels(
            title: "The secret of Monkey Island - Introduction",
            artwork:
            "https://i.pinimg.com/564x/26/2c/6e/262c6e8600aacb273e14aacf35a3914f.jpg",
          ),
        ),
      ]
    )).catchError((error) {
      print('Có lỗi xảy ra check :>>>>>>>>>>>>>> $error');
    }) ;
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(
      init: AudioController(),
      builder: (controller) {
        return Center(
          child: Column(
            children: [
              PlayerButtons(player: player),
              Expanded(child: PlayLists(player: player))
            ],
          ),
        );
      }
    );
  }


}
