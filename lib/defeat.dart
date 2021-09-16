import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:minecraft/main.dart';

final Color mainColor = Color(0xff7986cb);
final Color lightColor = Color(0xffaab6fe);
final Color secondaryColor = Color(0xffffa000);
final Color secondaryLightColor = Color(0xffffd149);
// final Color mainColor = Color(0xFF424255);
// final Color lightColor = Color(0xFF686877);
// final Color secondaryColor = Color(0xFFD39E4C);
// final Color secondaryLightColor = Color(0xFFDCB170);

AudioPlayer audioPlayer = AudioPlayer();
AudioCache cache = AudioCache();

class DefeatScreen extends StatelessWidget {
  final int score;
  final InterstitialAd ad;
  DefeatScreen(this.score, this.ad);

  @override
  Widget build(BuildContext context) {
    ad?.show();
    print('defeat: $score');
    playSound('decline');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text('Crafting Puzzle'),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  secondaryLightColor,
                  secondaryColor,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: SizedBox.shrink()),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Text(
                          'You died!',
                          style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(0, 3),
                                  blurRadius: 2,
                                ),
                              ],
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1
                                ..color = Colors.black),
                        ),
                        Text('You died!',
                            style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Text(
                          'Score: $score',
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(0, 3),
                                  blurRadius: 2,
                                ),
                              ],
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1
                                ..color = Colors.black),
                        ),
                        Text('Score: $score',
                            style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: FractionallySizedBox(
                      widthFactor: 0.25,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Game()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  lightColor,
                                  mainColor,
                                ],
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(0, 3),
                                    blurRadius: 2,
                                    spreadRadius: 0.5)
                              ],
                            ),
                            child: FittedBox(
                                child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.refresh_rounded,
                                      color: Colors.white,
                                    )))),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox.shrink()),
                  Expanded(child: SizedBox.shrink()),
                ],
              ),
            ),
          )),
    );
  }
}

void playSound(String sound) async {
  audioPlayer = await cache.play('sounds/$sound.wav',
      volume: sound == 'accept' ? 0.7 : 1);
}
