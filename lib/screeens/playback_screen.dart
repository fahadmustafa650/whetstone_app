import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class PlaybackScreen extends StatefulWidget {
  static final id = '/play_back_screen';
  @override
  _PlaybackScreenState createState() => _PlaybackScreenState();
}

class _PlaybackScreenState extends State<PlaybackScreen> {
  IconData videoPlayPauseIcon = Icons.play_arrow;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  FutureBuilder<void> videoPlayerScreen() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void changePlayIcon() {
    setState(() {
      if (!_controller.value.isPlaying) {
        videoPlayPauseIcon = Icons.pause;
        _controller.play();
      } else {
        videoPlayPauseIcon = Icons.play_arrow;
        _controller.pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            FontAwesomeIcons.photoVideo,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.microphone,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cut,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTopEditBtn(),
            videoPlayerScreen(),
            Row(
              children: [
                CustomDropdownButton(),
                playPauseBtn(),
                SizedBox(
                  width: 3,
                ),
                videoProgressIndicator(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  Container videoProgressIndicator(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.68,
        child: VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
          colors: VideoProgressColors(
            playedColor: Colors.blue,
            backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
          ),
        ));
  }

  CircleAvatar playPauseBtn() {
    return CircleAvatar(
      backgroundColor: Colors.lightBlueAccent,
      child: IconButton(
          icon: Icon(
            videoPlayPauseIcon,
            color: Colors.white,
          ),
          onPressed: () {
            changePlayIcon();
          }),
    );
  }

  Container customTopEditBtn() {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.topLeft,
      color: Colors.lightBlueAccent,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          FontAwesomeIcons.pen,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CustomDropdownButton extends StatefulWidget {
  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String dropdownValue = "1x";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Opacity(opacity: 0, child: const Icon(Icons.arrow_downward)),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['1x', '2x', '3x', '4x', '5x', '6x', '7x', '8x']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }
}
