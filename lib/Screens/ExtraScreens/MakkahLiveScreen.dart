import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MakkahLiveScreen extends StatefulWidget {
  @override
  _MakkahLiveScreenState createState() => _MakkahLiveScreenState();
}

class _MakkahLiveScreenState extends State<MakkahLiveScreen> {


  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  bool _isPlayerReady = false;

  var  id = YoutubePlayer.convertUrlToId("https://youtu.be/QqtlpfLACJU");
  var utils = AppUtils();


  @override
  void initState() {
     super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: id!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SafeArea(
    //     child: Center(
    //       child: YoutubePlayer(
    //         controller: _controller,
    //         showVideoProgressIndicator: true,
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: utils.appBar(),
      body: SafeArea(
        child: Center(
          child: YoutubePlayerBuilder(
            onExitFullScreen: () {
              // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
              SystemChrome.setPreferredOrientations(DeviceOrientation.values);
            },
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              topActions: <Widget>[
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    _controller.metadata.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                // IconButton(
                //   icon: const Icon(
                //     Icons.settings,
                //     color: Colors.white,
                //     size: 25.0,
                //   ),
                //   onPressed: () {
                //   },
                // ),
              ],
              onReady: () {
                _isPlayerReady = true;
              },
              onEnded: (data) {
                // _controller
                //     .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
              },
            ),
            builder: (context, player) =>ListView(
              children: [
                player,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
