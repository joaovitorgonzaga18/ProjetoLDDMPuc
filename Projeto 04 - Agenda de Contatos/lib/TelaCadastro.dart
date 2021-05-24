import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';


class TelaCadastro extends StatefulWidget {
  String valor;
  TelaCadastro({this.valor});
  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<TelaCadastro> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Agenda de Contatos 1.0 - Prática 04'),
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
  void _salvarDados() async{
    /*String login = _LoginController.text;
    String senha = _Senha2Controller.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("login", login);
    await prefs.setString("senha", senha);
    print("Salvo: " + prefs.getString("login").toString() + "   " + prefs.getString("senha").toString());*/

    print("Novo usuario criado!");
    FirebaseFirestore.instance
        .collection("usuarios")
        .doc(_LoginController.text)
        .set({
      "login": _LoginController.text,
      "senha": _SenhaController.text,
    });
  }

  TextEditingController _LoginController = TextEditingController();
  TextEditingController _SenhaController = TextEditingController();
  TextEditingController _Senha2Controller = TextEditingController();
  TextEditingController _AvisoController = TextEditingController();


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
            Column(
              children:[
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'SEU NOVO LOGIN',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Container(
                          width: 170,
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
                          'SUA NOVA SENHA',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Container(
                          width: 170,
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
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'CONFIRME SENHA',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Container(
                          width: 170,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            controller: _Senha2Controller,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Text('' + _AvisoController.text , style: TextStyle(color: Colors.red),),
                Row(
                  children: [
                    SizedBox(width: 120,
                      child:
                      ElevatedButton(
                        onPressed: (){
                          if(_LoginController.text == ''){
                            _AvisoController.text = 'O campo de Login é obrigatório!';
                            setState(() {});
                          }else if(_SenhaController.text == ''){
                            _AvisoController.text = 'O campo de senha é obrigatório!';
                            setState(() {});
                          }else if(_SenhaController.text != _Senha2Controller.text){
                            _AvisoController.text = 'As senhas nao coincidem!';
                            setState(() {});
                          }else{
                            _AvisoController.text = '';
                            setState(() {});
                            _salvarDados();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyApp(),
                              ),
                            );
                          }
                          /**/
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
