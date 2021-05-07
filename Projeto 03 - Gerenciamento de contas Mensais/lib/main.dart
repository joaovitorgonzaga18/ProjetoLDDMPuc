import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SegundaTela.dart';
import 'TerceiraTela.dart';

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
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Gerenciamento de contas mensais - Prática 03'),
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
  bool resp = false;

  TextEditingController _LoginController = TextEditingController();
  TextEditingController _SenhaController = TextEditingController();
  TextEditingController _AvisoController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _verificaDados() async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString("login") == _LoginController.text && prefs.getString("senha") == _SenhaController.text){
      resp = true;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(15.0),
          children: [
            Text('GERENCIAR CONTAS APP', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Column(
              children:[
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'SEU LOGIN',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            controller: _LoginController,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'SUA SENHA',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            controller: _SenhaController,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Text('' + _AvisoController.text, style: TextStyle(color: Colors.red),),
                Row(
                  children: [
                    SizedBox(width: 120,
                      child:
                      ElevatedButton(
                        onPressed: (){
                          _verificaDados();
                          if((_LoginController.text != '' && _SenhaController != '') && resp){
                            print("DEU CERTO!");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TerceiraTela(),
                              ),
                            );
                          }else{
                            _AvisoController.text = 'Login ou Senha incorretos!';
                            setState(() {});
                          }
                          /**/
                        },
                        child: Text(
                          'ENTRAR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 120,
                    child:
                      ElevatedButton(
                        onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SegundaTela(),
                              ),
                            );
                        },
                        child: Text(
                          'CADASTRAR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
