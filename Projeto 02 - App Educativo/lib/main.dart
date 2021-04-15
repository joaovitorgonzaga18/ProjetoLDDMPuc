import 'package:flutter/material.dart';
import 'SegundaTela.dart';

void main() {
  runApp(MaterialApp(
    home: PrimeiraTela(),
    title: 'AppEducativo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: const Color(0xFF9CC1DE),
    ),
  ));
}

class PrimeiraTela extends StatefulWidget{
  @override
  PrimeiraTela({Key key, this.title, backgroundColor}) : super (key: key);
  final String title;
  _PrimeiraTelaState createState() => _PrimeiraTelaState();

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
        scaffoldBackgroundColor: const Color(0xFF9CC1DE),
      ),
      home: PrimeiraTela(title: 'Flutter Demo Home Page'),
    );
  }

}

class _PrimeiraTelaState extends State<PrimeiraTela> {

  TextEditingController _LoginController = TextEditingController();
  TextEditingController _SenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: ListView(
          padding: EdgeInsets.all(15.0),
          children: [
            Column(
              children: [
                SizedBox(height: 100),
                RichText(
                  text: TextSpan(
                    text: 'APP ',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    children:<TextSpan>[
                      TextSpan(text: 'E', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red)),
                      TextSpan(text: 'D', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.orange)),
                      TextSpan(text: 'U', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.yellow)),
                      TextSpan(text: 'C', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green)),
                      TextSpan(text: 'A', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue)),
                      TextSpan(text: 'T', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.lightBlue.shade900)),
                      TextSpan(text: 'I', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.purple)),
                      TextSpan(text: 'V', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.purpleAccent)),
                      TextSpan(text: 'O', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.pink)),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'SEU LOGIN',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: (){
                            String login = _LoginController.text;
                            String senha = _SenhaController.text;
                            if(login.length >= 1 && senha.length >= 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SegundaTela(
                                            valor: _LoginController.text)
                                ),
                              );
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
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
