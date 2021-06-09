import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

class TelaJogo extends StatefulWidget {
  TelaJogo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TelaJogoState createState() => _TelaJogoState();
}

class _TelaJogoState extends State<TelaJogo> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioCache.load("musica.mp3");

  }

  int _counter = 0;
  var prefs = null;

  void iniciaPrefs() async {
    prefs = await SharedPreferences.getInstance();
    if(prefs.getInt("pontos") == null) {
      await prefs.setInt("pontos", 0);
    } else if(prefs.getInt("upgrade1") == null) {
      await prefs.setInt("upgrade1", 0);
    } else if (prefs.getInt("upgrade2") == null) {
      await prefs.setInt("upgrade2", 0);
    } else if (prefs.getInt("upgrade3") == null) {
      await prefs.setInt("upgrade3", 0);
    }

    _counter = prefs.getInt("pontos");

  }

  void _aumentarPontos()  {
    setState(()  {
      _counter = prefs.getInt("pontos");
      print("$_counter");
    });
  }

  void _runUpdgrade() async{
    while(prefs.getInt("upgrade2") > 0){
      await Future.delayed(Duration(seconds: 1));
      await prefs.setInt("pontos", prefs.getInt("pontos") + prefs.getInt("upgrade2"));
      await _aumentarPontos();
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    //initState();
    //audioCache.play("musica.mp3");
    iniciaPrefs();
    _runUpdgrade();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        title: Text("Sua pontuação : " + _counter.toString()),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.bubble_chart)),
            Tab(icon: Icon(Icons.attach_money)),
          ],
        ),
      ),
      body: Center(
        child: TabBarView(
          children: [
            new Container(
              decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/mouse.jpg"),
                  fit: BoxFit.cover,
              ),),
              child:
                Row(
                  children: [
                    Row(
                      children: [
                        Material(
                          child: InkWell(
                            onTap: () async {
                              //print("pontos: " + _counter.toString());
                              if(prefs.getInt("upgrade3") > 0){
                                await prefs.setInt("pontos", (prefs.getInt("pontos") * 2));
                                await prefs.setInt("upgrade3", prefs.getInt("upgrade3") - 1);
                                await _aumentarPontos();
                              }else if(prefs.getInt("upgrade1") > 0){
                                await prefs.setInt("pontos", (prefs.getInt("pontos") + 1 + prefs.getInt("upgrade1")));
                                await _aumentarPontos();
                              } else {
                                await prefs.setInt("pontos", (prefs.getInt("pontos") + 1));
                                await _aumentarPontos();

                              }
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/images/coin.png",
                                    width: 320.0, height: 110.0),
                              ),),
                          )
                        )
                      ],
                    ),
                    Row(
                      children:[
                      ]
                    ),
                  ],
                ),

            ),
            new Container(
              child: ListView(
                children: [
                  Text("UPGRADES!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ListTile(
                    title: Text("Upgrade: DOIS CLICKS POR 1"),
                    subtitle: Text("Custo: 10 pontos"),
                    onTap: () {
                      if(_counter >= 10) {
                        prefs.setInt("upgrade1", prefs.getInt("upgrade1") + 1);
                        prefs.setInt("pontos", prefs.getInt("pontos") - 10);
                        _aumentarPontos();
                        print(prefs.getInt("upgrade1").toString());
                      }
                    } ,
                  ),
                  ListTile(
                    title: Text("Upgrade: CLICK AUTOMÁTICO"),
                    subtitle: Text("Custo: 20 pontos"),
                    tileColor: Colors.grey.shade100,
                    onTap: () {
                      if(_counter >= 20) {
                        prefs.setInt("upgrade2", prefs.getInt("upgrade2") + 1);
                        prefs.setInt("pontos", prefs.getInt("pontos") - 20);
                        _aumentarPontos();
                        print(prefs.getInt("upgrade2").toString());
                      }
                    },
                  ),
                  ListTile(
                    title: Text("Upgrade: SUPER CLICK!!!! (duplica os pontos - uso único por compra)"),
                    subtitle: Text("Custo: 1000 pontos"),
                    onTap: () {
                      if(_counter >= 1000) {
                        prefs.setInt("upgrade3", prefs.getInt("upgrade3") + 1);
                        prefs.setInt("pontos", prefs.getInt("pontos") - 1000);
                        print(prefs.getInt("upgrade3").toString());
                        _aumentarPontos();
                      }
                    },
                  ),
                ],
              ),
              /*child:
                Row(
                  children: [
                    Material(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/images/logo.png',
                                width: 320.0, height: 110.0),
                          ),),
                      )
                    ),
                  ],
                ),*/

            ),
          ],
        )
      ),
      ),
    );
  }
}
