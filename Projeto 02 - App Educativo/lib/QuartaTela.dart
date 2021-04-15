import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class QuartaTela extends StatefulWidget {
  @override
  _QuartaTelaState createState() => _QuartaTelaState();
}

class _QuartaTelaState extends State<QuartaTela> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;

  @override
  void initState(){
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose(){
    super.dispose();

    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
  }

  playMusic(String path) async{
    await audioCache.play(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toque e escute as letras!'),
        backgroundColor: Colors.green.shade300,
      ),
      body: Container(
        child: ListView(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('1', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('1.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('2', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('2.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('3', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('3.ogg');
                        },
                      ),
                    )
                  ],

                ),SizedBox(width: 25,),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('4', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('4.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('5', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('5.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('6', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('6.ogg');
                        },
                      ),
                    )
                  ],

                ),SizedBox(width: 25,),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('7', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('7.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('8', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('8.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('9', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('9.ogg');
                        },
                      ),
                    )
                  ],

                ),SizedBox(width: 25,),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('10', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('10.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('11', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('11.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('12', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('12.ogg');
                        },
                      ),
                    )
                  ],

                ),SizedBox(width: 25,),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('13', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('13.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('14', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('14.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('15', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('15.ogg');
                        },
                      ),
                    )
                  ],

                ),SizedBox(width: 25,),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('16', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('16.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('17', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('17.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('18', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('18.ogg');
                        },
                      ),
                    )
                  ],

                ),SizedBox(width: 25,),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('19', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('19.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('20', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('20.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
              ],
            ),

          ],
        ),
      ),
    );
  }
}