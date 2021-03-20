import 'package:flutter/material.dart';
import 'package:halo/providers/video_provider.dart';
import 'package:halo/widgets/video_card_button.dart';
import 'package:halo/widgets/video_background.dart';
import 'package:provider/provider.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VideoProvider>(context, listen: false).fetchVideoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
      ),
      body: VideoBackgroundWidget(
        childWidget: VideoContentList(),
      ),
    );
  }
}

class VideoContentList extends StatelessWidget {
  const VideoContentList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoProvider>(builder: (context, videoService, _) {
      return Scaffold(
        body: videoService.videoList != null
            ? VideoList(
                videoService: videoService,
              )
            : Center(child: CircularProgressIndicator())
      );
    });
  }
}

class VideoList extends StatefulWidget {
  const VideoList({
    Key key,
    @required this.videoService,
  }) : super(key: key);
  final VideoProvider videoService;

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Let the ListView know how many items it needs to build.
      itemCount: widget.videoService.videoList.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = widget.videoService.videoList[index];

        return Card(
          elevation: 50,
          shadowColor: Colors.black,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item.bgImage),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      VideoCardButton(
                        buttonIcon: Icons.play_circle_outline,
                        linkToVideo: item.mediaUrl,
                        titleVideo: item.title,
                      ),
                      VideoCardButton(
                        buttonIcon: Icons.favorite,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(item.author,
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('00:${item.duration}',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
