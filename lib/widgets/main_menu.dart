import 'package:flutter/material.dart';
import 'package:halo/widgets/video_background.dart';

import 'menu_grid.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({
    Key key,
  }) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return VideoBackgroundWidget(
      childWidget: MenuGrid(),
    );
  }
}

