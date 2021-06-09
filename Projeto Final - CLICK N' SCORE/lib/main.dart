import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'TelaJogo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        textSelectionColor: Colors.white,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print('$_counter');
    });
  }

  void telaJogo(){
    TelaJogo tela = new TelaJogo();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            tela,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: ListView(
          padding: EdgeInsets.only(top: 150.0),
          children: [
            Row(
              children: [
                SizedBox(
                  height: 200,
                  child: Image( image: AssetImage('assets/images/logo.png'), width: 300, )
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 320,
                  child: ElevatedButton(
                    child: Text('JOGAR!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                    ),
                    onPressed: (){ telaJogo();
                     /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TelaJogo(),
                        ),
                      );*/
                    } ,
                  ),
                )
              ],
            ),

          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), */// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
