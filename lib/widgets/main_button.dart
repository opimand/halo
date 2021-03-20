import 'package:flutter/material.dart';
import 'package:halo/screens/video_list_screen.dart';

class MainRouteButton extends StatefulWidget {
  final Image imgUp;
  final Image imgDown;
  final String titleButton;

  const MainRouteButton({Key key, this.imgUp, this.imgDown, this.titleButton})
      : super(key: key);

  @override
  _MainRouteButtonState createState() => _MainRouteButtonState();
}

class _MainRouteButtonState extends State<MainRouteButton> {
  Image img;
  bool isPressed = false;

  @override
  void initState() {
    img = this.widget.imgDown;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: 150,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade400.withOpacity(0.7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              img,
              SizedBox(
                height: 10,
              ),
              Text(
                this.widget.titleButton ?? 'Button',
                style: TextStyle(
                  color: isPressed ? Colors.amber : Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        onTapDown: (tap) {
          setState(() {
            img = this.widget.imgUp;
            isPressed = true;
          });
        },
        onTapUp: (tap) {
          setState(() {
            img = this.widget.imgDown;
            isPressed = false;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VideoListScreen()));
          });
        });
  }
}
