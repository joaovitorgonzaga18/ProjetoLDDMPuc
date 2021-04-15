import 'package:flutter/material.dart';
import 'TerceiraTela.dart';
import 'QuartaTela.dart';

class SegundaTela extends StatefulWidget {
  String valor;
  SegundaTela({this.valor});
  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Seja bem vindo ' + widget.valor),
        backgroundColor: Colors.green.shade300,
      ),
      body: Center(
        child: Row(
          children: [
            SizedBox(width: 20,),
            Column( children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('ALFABETO!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
              ),

              Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  color: Colors.yellow,
                  child: Image(
                    image: AssetImage('assets/images/001-abc.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
                ElevatedButton(
                  onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                               TerceiraTela()
                        ),
                      );
                  },
                  child: Text(
                    'Vamos! >',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('NÚMEROS!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    color: Colors.pink,
                    child: Image(
                      image: AssetImage('assets/images/002-cubes.png'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                ElevatedButton(
                    child: Text(
                        'Vamos! >',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200)
                  ), onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                              QuartaTela(),
                        ),
                      );
                  },
                ),
              ],
            ),
          ],
          ),
        ),
    );
  }
}

