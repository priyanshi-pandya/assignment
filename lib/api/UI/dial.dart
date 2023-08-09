import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  double currentValue = 0;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration _duration = const Duration();
  Duration _positioned = const Duration();
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    initializeAudioPlayer();
  }

  void initializeAudioPlayer() async {
    audioPlayer.positionStream.listen((p) {
      try {
        if (context.mounted) {
          setState(() {
            _positioned = p;
          });
        } else {
          audioPlayer.stop();
          return;
        }
      } on Error {
        audioPlayer.stop();
        audioPlayer.dispose();
        return;
      }
    });

    audioPlayer.durationStream.listen((d) {
      if (context.mounted) {
        setState(() {
          _duration = d!;
        });
      } else {
        return;
      }
    });
    await audioPlayer.setAudioSource(
      AudioSource.uri(
        Uri.parse(
          'https://filesamples.com/samples/audio/mp3/sample4.mp3',
        ),
      ),
    );
    await audioPlayer.play();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 100,
              sigmaX: 100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'asset/icons/arrow_down.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const Text(
                      'Playing from Favourites',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'asset/icons/more.png',
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                      'https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg',
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.85,
                      fit: BoxFit.fill),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Soothing Sound',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 20,
                                  child: Text(
                                    "Unknown artist",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(convertToMinutesSeconds(
                              _positioned.inSeconds.toDouble())),
                          const Spacer(),
                          const Text("4:04"),
                        ],
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: _duration.inSeconds.toDouble(),
                      value: _positioned.inSeconds.toDouble(),
                      thumbColor: Colors.black87,
                      activeColor: Colors.black87,
                      inactiveColor: Colors.black12,
                      onChanged: (value) {
                        setState(() {
                          audioPlayer.seek(Duration(seconds: value.toInt()));
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'asset/icons/shuffle.png',
                            height: 20,
                            width: 20,
                          ),
                          Image.asset(
                            'asset/icons/previous.png',
                            height: 25,
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: changePlayPause,
                            child: _isPlaying == true
                                ? Image.asset(
                              'asset/icons/pause.png',
                              height: 25,
                              width: 25,
                            )
                                : Image.asset(
                              'asset/icons/play.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                          Image.asset(
                            'asset/icons/next.png',
                            height: 25,
                            width: 25,
                          ),
                          Image.asset(
                            'asset/icons/repeat.png',
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  changePlayPause() {
    if (_isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }

    _isPlaying = !_isPlaying;
  }

  String convertToMinutesSeconds(double seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds.toInt() % 60;

    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
