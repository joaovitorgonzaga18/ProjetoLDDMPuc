import 'package:agendacontatos_app/TelaCadastro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'home.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'SegundaTela.dart';
//import 'TerceiraTela.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TelaLogin(title: 'Agenda de contatos 1.0 - Prática 04'),
    );
  }
}

class TelaLogin extends StatefulWidget {
  TelaLogin({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TelaLogin> {
  int _counter = 0;
  bool resp = false;

  TextEditingController _LoginController = TextEditingController();
  TextEditingController _SenhaController = TextEditingController();
  TextEditingController _AvisoController = TextEditingController();

  void _verificaDados() async{
    /*final prefs = await SharedPreferences.getInstance();
    if(prefs.getString("login") == _LoginController.text && prefs.getString("senha") == _SenhaController.text){
      resp = true;
    }*/

    print(_LoginController.text);
    String caminho = _LoginController.text;
    var user = await FirebaseFirestore.instance
        .doc('/usuarios/' + caminho)
        .get();

    if(user["login"] == (_LoginController.text) && user["senha"] == (_SenhaController.text)) { resp = true; }

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
            Text('AGENDA DE CONTATOS 1.0', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
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
                            _resetFields();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Home(),
                              ),
                            );
                          }else{
                            _AvisoController.text = 'Login ou Senha incorretos!';
                            setState(() {});
                          }

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
                                  TelaCadastro(),
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

  //PROCEDIMENTO PARA LIMPAR CAMPOS
  void _resetFields() {
    _LoginController.text = "";
    _SenhaController.text = "";
    _AvisoController.text = "";
    setState(() {});
  }
}
