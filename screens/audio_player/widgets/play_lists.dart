import 'package:firestore/import.dart';
import 'package:just_audio/just_audio.dart';

class PlayLists extends StatelessWidget {
  const PlayLists({super.key, required this.player});

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: player.sequenceStateStream,
      builder: (_, snapshot) {
        final state = snapshot.data;
        final sequence = state?.sequence ?? [];

        return ListView(
          children: [
            for (var i = 0; i < sequence.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  selected: i == state?.currentIndex,
                  leading: Image.network(sequence[i].tag.artwork, width: 100, height: 100,fit: BoxFit.cover),
                  title: Text(sequence[i].tag.title),
                  onTap: () {
                    player.seek(Duration.zero, index: i);
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
