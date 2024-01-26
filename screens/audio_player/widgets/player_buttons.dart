import 'package:firestore/import.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({super.key, required this.player});

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<bool>(
          stream: player.shuffleModeEnabledStream,
          builder: (context, snapshot) {
            return shuffleButton(context, snapshot.data ?? false);
          },
        ),
        StreamBuilder(
          stream: player.sequenceStateStream,
          builder: (_, __) {
            return previousButton();
          },
        ),
        StreamBuilder(
          stream: player.playerStateStream,
          builder: (_, snapshot) {
            final playerState = snapshot.data;

            if(!empty(playerState)) {
              return playPauseButton(playerState!);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder(
          stream: player.sequenceStateStream,
          builder: (_, __) {
            return nextButton();
          },
        ),
        StreamBuilder<LoopMode>(
          stream: player.loopModeStream,
          builder: (context, snapshot) {
            return repeatButton(context, snapshot.data ?? LoopMode.off);
          },
        ),
      ],
    );
  }

  // random audio
  shuffleButton(BuildContext ctx, bool isEnable) {
    return IconButton(
        onPressed: () async {
          final enable = !isEnable;
          if(enable) {
            await player.shuffle();
          } else {
            await player.setShuffleModeEnabled(enable);
          }
        },
        icon: isEnable
            ? Icon(Icons.shuffle, color: Colors.red[100])
            : const Icon(Icons.shuffle)
    );
  }

  previousButton() {
    return IconButton(
      icon: const Icon(Icons.skip_previous),
      onPressed: player.hasPrevious ? player.seekToPrevious : null,
    );
  }

  playPauseButton(PlayerState playerState) {
    final processingState = playerState.processingState;

    if(processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
      return Container(
        margin: const EdgeInsets.all(8),
        width: 64,
        height: 64,
        child: const CircularProgressIndicator(),
      );
    } else if(player.playing != true) {
      return IconButton(
        onPressed: player.play,
        icon: const Icon(Icons.play_arrow),
      );
    } else if(processingState != ProcessingState.completed) {
      return IconButton(
        onPressed: player.pause,
        icon: const Icon(Icons.pause),
      );
    } else {
      return IconButton(
          onPressed: () {
            player.seek(
                Duration.zero,
                index: player.effectiveIndices?.first
            );
          }, icon: const Icon(Icons.replay)
      );
    }
  }

  nextButton() {
    return IconButton(
      icon: const Icon(Icons.skip_next),
      onPressed: player.hasNext ? player.seekToNext : null,
    );
  }

  repeatButton(BuildContext ctx, LoopMode loopMode) {
    final icons = [
      const Icon(Icons.repeat),
      Icon(Icons.repeat, color: Colors.red[100]),
      Icon(Icons.repeat_one, color: Colors.red[100]),
    ];

    const cycleModes = [
      LoopMode.off,
      LoopMode.all,
      LoopMode.one,
    ];

    final index = cycleModes.indexOf(loopMode);
    return IconButton(
      icon: icons[index],
      onPressed: () {
        player.setLoopMode(
            cycleModes[(cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
      },
    );
  }
}
