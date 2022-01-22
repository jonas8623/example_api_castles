import 'package:example_api_got_castles/model/model.dart';
import 'package:example_api_got_castles/service/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Castle>? _listCastles;
  bool _progress = false;

  _rowProgress() {
    return _progress ? const CircularProgressIndicator() : Container();
  }

  _rowListCastles() {
    if(_listCastles == null) {
      return const Text('Clique no botão para verifcar os castelos');
    }
    return ListView.builder(
        itemCount: _listCastles!.length, //  quantidade de castelos
        itemBuilder: (context, index) {
          print('${_listCastles!.elementAt(index).toString()}'); // mostrar um elemento por vez

          return ListTile(
            title: Text('${_listCastles!.elementAt(index).name}'),
            subtitle: Text('${_listCastles!.elementAt(index).location}'),
            leading: const CircleAvatar(backgroundColor: Colors.grey,),
            trailing: const Icon(Icons.play_arrow_rounded),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example API castles'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 600,
              margin: const EdgeInsets.fromLTRB(20.7, 20.8, 20.7, 0.0),
              padding: const EdgeInsets.all(12.9),
              child: _rowListCastles(),
            ),
            _rowProgress()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle),
          onPressed: () async {
            _displayCastles(context);
          }
      ),
    );
  }

  _displayCastles(BuildContext context) async {
    // chamar a classe GotServices

    final gotService = GotServices();

    setState(() {
      _progress = true;
    });

    _listCastles = await gotService.fetchCastles();

    setState(() {
      print('Realizou todo o serviço');
      _progress = false;
    });

    // _showSnackBar(context, _listCastles.toString());

  }

  _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

}
