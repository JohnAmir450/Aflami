import 'package:aflami/features/home/data/models/trailer_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerItem extends StatelessWidget {
  final Results trailer;

  const TrailerItem({super.key, required this.trailer});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: trailer.key!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        onReady: () {
            
        },
      ),
    );
  }
}
