import 'package:flutter/material.dart';
import 'package:halo/localization/localization.dart';
import 'package:halo/providers/video_provider.dart';
import 'package:halo/widgets/main_menu.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, "/");
        break;
      case 1:
        Navigator.pushNamed(context, "/progress_screen");
        break;
      case 2:
        Navigator.pushNamed(context, "/profile_screen");
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VideoProvider>(context, listen: false).getSplashVideo();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate('library'),
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.transparent,
          ),
          body: MainMenu(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            backgroundColor: Colors.black.withOpacity(0.8),
            onTap: _onItemTap,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    'assets/library.png',
                  ),
                ),
                activeIcon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    'assets/library_active.png',
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    'assets/progress.png',
                  ),
                ),
                activeIcon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    'assets/progress_active.png',
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset(
                  'assets/settings.png',
                ),
                activeIcon: Image.asset(
                  'assets/settings_onhover.png',
                ),
              ),
            ],
          ),
        );
  }
}
