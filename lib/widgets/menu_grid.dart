import 'package:flutter/material.dart';
import 'package:halo/localization/localization.dart';
import 'package:halo/widgets/main_button.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: MainRouteButton(
                    imgDown: Image.asset('assets/audio.png'),
                    imgUp: Image.asset('assets/audio_hover.png'),
                    titleButton: AppLocalizations.of(context).translate('audio')),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: MainRouteButton(
                  imgDown: Image.asset('assets/video.png'),
                  imgUp: Image.asset('assets/video_hover.png'),
                  titleButton: AppLocalizations.of(context).translate('video'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: MainRouteButton(
                    imgDown: Image.asset('assets/inspo.png'),
                    imgUp: Image.asset('assets/inspohover.png'),
                    titleButton: AppLocalizations.of(context).translate('inspiration')),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: MainRouteButton(
                    imgDown: Image.asset('assets/motivators.png'),
                    imgUp: Image.asset('assets/page_1.png'),
                    titleButton:  AppLocalizations.of(context).translate('motivation')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
