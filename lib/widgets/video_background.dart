import 'package:flutter/material.dart';
import 'package:halo/providers/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoBackgroundWidget extends StatefulWidget {
  final Widget childWidget;
  VideoBackgroundWidget({@required this.childWidget});

  @override
  _VideoBackgroundWidgetState createState() => _VideoBackgroundWidgetState();
}

class _VideoBackgroundWidgetState extends State<VideoBackgroundWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/bg_video.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoProvider>(builder: (context, videoService, _) {
      return Stack(children: <Widget>[
              SizedBox.expand(
                  child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: _controller.value.size?.width ?? 0,
                  height: _controller.value.size?.height ?? 0,
                  child: VideoPlayer(_controller),
                ),
              )),
              this.widget.childWidget,
            ]);
    });
  }
}
