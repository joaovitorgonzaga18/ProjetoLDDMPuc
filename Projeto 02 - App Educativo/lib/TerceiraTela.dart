import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class TerceiraTela extends StatefulWidget {
  @override
  _TerceiraTelaState createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {

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
                        child: Text('A', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                                            onPressed: (){
                                              playMusic('A.ogg');
                                            },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                      width: 100,
                      child: Text('B', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                                            onPressed: (){
                                              playMusic('B.ogg');
                                            },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('C', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                                            onPressed: (){
                                              playMusic('C.ogg');
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
                        child: Text('D', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('D.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('E', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('E.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('F', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('F.ogg');
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
                        child: Text('G', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('G.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('H', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('H.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('I', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('I.ogg');
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
                        child: Text('J', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('J.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('K', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('K.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('L', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('L.ogg');
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
                        child: Text('M', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('M.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('N', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('N.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('O', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('O.ogg');
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
                        child: Text('P', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('P.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('Q', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('Q.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('R', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('R.ogg');
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
                        child: Text('S', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('S.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('T', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('T.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('U', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('U.ogg');
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
                        child: Text('V', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('V.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('W', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('W.ogg');
                        },
                      ),
                    ),
                  ],

                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('X', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('X.ogg');
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
                        child: Text('Y', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('Y.ogg');
                        },
                      ),
                    ),
                  ],
                ),SizedBox(width: 25,),
                Column(
                  children: [
                    Container(
                        width: 100,
                        child: Text('Z', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(child: Text('ESCUTAR', textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)),
                        onPressed: (){
                          playMusic('Z.ogg');
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