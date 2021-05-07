import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class TerceiraTela extends StatefulWidget {
  String valor;
  TerceiraTela({this.valor});

  String get title => 'Contas mensais';
  @override
  _TerceiraTelaState createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {

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



class _MyHomePageState extends State<MyHomePage> {
  List<_tarefa> _listaTarefas = [];
  TextEditingController _controllerTarefa = TextEditingController();
  TextEditingController _controllerValor = TextEditingController();
  TextEditingController _controllerData = TextEditingController();

  @override

  void initState() {
    _listarTarefas().then((List<_tarefa> rec) {
      setState(() {
        _listaTarefas = rec;
      });
    });

    super.initState();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(15.0),
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text('Nome da conta', style: TextStyle(fontSize: 20)),
                            Container(
                              width: 350,
                              child: TextField(
                                controller: _controllerTarefa,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Text('Valor da conta', style: TextStyle(fontSize: 20)),
                            Container(
                              width: 350,
                              child: TextField(
                                controller: _controllerValor,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Text('Data da conta', style: TextStyle(fontSize: 20)),
                            Container(
                              width: 350,
                              child: TextField(
                                controller: _controllerData,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),

                            ElevatedButton(onPressed: () async {
                              String conta = _controllerTarefa.text;
                              String valor = _controllerValor.text;
                              String data = _controllerData.text;
                              _salvarDados(conta, valor, data);
                              _resetFields();
                              setState(() {});
                            },
                                child: Text('ADICIONAR NOVA CONTA')),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 1000,
              child: ListView.builder(
                  itemCount: _listaTarefas.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text('Conta : ' + _listaTarefas[index].tarefa, style: TextStyle(
                        fontSize: 24,
                      ),),
                      subtitle: Text('Valor : ' + _listaTarefas[index].valor + " reais" + "\nVencimento : " + _listaTarefas[index].data, style: TextStyle(
                        fontSize: 19,

                      ),),
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                //backgroundColor: Colors.deepPurple,
                                title: Text("Atualizar Conta"),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(
                                    height: 50,
                                    child: TextField(
                                        controller: _controllerTarefa,
                                        decoration: InputDecoration(
                                            labelText: 'Título'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: TextField(
                                          controller: _controllerValor,
                                          decoration: InputDecoration(
                                              labelText: 'Valor'),),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: TextField(
                                          controller: _controllerData,
                                          decoration: InputDecoration(
                                              labelText: 'Data'),
                                      ),
                                    ),
                                  ],
                                ),

                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancelar")
                                  ),
                                  FlatButton(
                                      onPressed: () async {
                                        _atualizarTarefa(
                                            _listaTarefas[index].idTarefa);
                                        setState(() {
                                          _listaTarefas[index].tarefa =
                                              _controllerTarefa.text;
                                          _listaTarefas[index].valor = _controllerValor.text;
                                          _listaTarefas[index].data =  _controllerData.text;
                                        });
                                        _resetFields();
                                        Navigator.pop(context);
                                      },
                                      child: Text("Salvar")
                                  ),
                                  _resetFields(),
                                ],
                              );
                            }
                        );
                      },
                      onLongPress: () async {
                        _excluirTarefa(_listaTarefas[index].idTarefa);
                        setState(() {
                          _listaTarefas.remove(_listaTarefas[index]);
                        });
                      },

                    );
                  }
                  ),
            ),
            /*Row(
              children: [
                Column(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 1000,
                        width: 350,
                      child: ListView.builder (
                        shrinkWrap: true,
                        itemCount: _listaTarefas.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text(_listaTarefas[index].tarefa, style: TextStyle(
                              fontSize: 24,
                              color: Colors.deepPurple,
                            ),),
                          );
                        }
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }


  _excluirTarefa(int id) async {
    Database bd = await _recuperarBancoDados();
    int retorno = await bd.delete(
        "tarefas",
        where: "id=?",
        whereArgs: [id]
    );
    print("Itens excluidos: " + retorno.toString());
  }

  _atualizarTarefa(int id) async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosTarefa = {
      "tarefa": _controllerTarefa.text,
      "valor": _controllerValor.text,
      "data" : _controllerData.text,
    };
    int retorno = await bd.update(
        "tarefas", dadosTarefa,
        where: "id = ?", //caracter curinga
        whereArgs: [id]
    );
    print("Itens atualizados: " + retorno.toString());
  }

  _salvarDados(String tarefa, String valor, String data) async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosTarefa = {
      "tarefa": tarefa,
      "valor": valor,
      "data" : data,
    };
    int id = await bd.insert("tarefas", dadosTarefa);
    setState(() {
      _listaTarefas.add(_tarefa(id, tarefa, valor, data));
    });
    print("Salvo: $id ");
  }


  Future<List<_tarefa>> _listarTarefas() async {
    Database db = await _recuperarBancoDados();
    List<Map<String, dynamic>> tarefas = await db.rawQuery(
        "SELECT * FROM tarefas");
    List<_tarefa> resp = [];
    for (Map<String, dynamic> tasks in tarefas) {
      resp.add(_tarefa(tasks["id"], tasks["tarefa"], tasks["valor"], tasks["data"]));
    } //fim for
    return resp;
  }

  _resetFields() {
    _controllerTarefa.text = "";
    _controllerValor.text = "";
    _controllerData.text = "";
  }
}

Future<List<_tarefa>> _listarTarefas() async {
  Database db = await _recuperarBancoDados();
  List<Map<String, dynamic>> tarefas = await db.rawQuery(
      "SELECT * FROM tarefas");
  List<_tarefa> resp = [];
  for (Map<String, dynamic> tasks in tarefas) {
    resp.add(_tarefa(tasks["id"], tasks["tarefa"], tasks["valor"], tasks["data"]));
  } //fim for
  return resp;
}


_recuperarBancoDados() async {
  final caminhoBancoDados = await getDatabasesPath();
  final localBancoDados = path.join(caminhoBancoDados, "banco.bd");
  var bd = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente) {
        String sql = "CREATE TABLE tarefas (id INTEGER PRIMARY KEY AUTOINCREMENT, tarefa VARCHAR, valor VARCHAR, data VARCHAR) ";
        db.execute(sql);
      }
  );
  return bd;
  //print("aberto: " + bd.isOpen.toString() );
}

/*
* Classe tarefa
* Um objeto do tipo tarefa contém os atributos id da tarefa e a tarefa em si.
*/
class _tarefa {
  int idTarefa;
  String tarefa;
  String valor;
  String data;

  _tarefa(idTarefa, tarefa, valor, data) {
    this.idTarefa = idTarefa;
    this.tarefa = tarefa;
    this.valor = valor;
    this.data = data;
  }
}
/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

*/