import 'package:flutter/material.dart';
import 'package:halo/screens/video_player_screen.dart';

class VideoCardButton extends StatefulWidget {
  final IconData buttonIcon;
  final String linkToVideo;
  final String titleVideo;
  VideoCardButton(
      {Key key, @required this.buttonIcon, this.linkToVideo, this.titleVideo})
      : super(key: key);

  @override
  _VideoCardButtonState createState() => _VideoCardButtonState();
}

class _VideoCardButtonState extends State<VideoCardButton> {
  Color _iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (tap) {
          setState(() {
            _iconColor = Colors.orangeAccent;
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                        linkToVideo: this.widget.linkToVideo,
                        titleVideo: this.widget.titleVideo,
                      )));
        },
        onTapUp: (tap) {
          setState(() {
            _iconColor = Colors.white;
          });
        },
        child: Icon(
          this.widget.buttonIcon,
          color: _iconColor,
          size: 36.0,
        ));
  }
}
