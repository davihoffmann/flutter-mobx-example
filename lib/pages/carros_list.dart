import 'package:flutter/material.dart';
import 'package:flutter_app_mobx_exemple/model/carro.dart';
import 'package:flutter_app_mobx_exemple/model/carros_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarrosList extends StatefulWidget {
  @override
  _CarrosListState createState() => _CarrosListState();
}

class _CarrosListState extends State<CarrosList>
    with AutomaticKeepAliveClientMixin<CarrosList> {
  List<Carro> carros;

  final _model = CarrosModel();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  void _fetch() {
    _model.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Utilizado para redesenhar pequenas partes da tela, sem necessidade de recarrgar todo o build
    // Melhora o gerenciamento de estado da tela (observer)
    // Programacao reativa
    return Observer(
      builder: (context) {
        List<Carro> carros = _model.carros;

        print("error: >>> ${_model.error}");

        if (_model.error != null) {
          return GestureDetector(
            onTap: _fetch,
            child: Text(
                "Não foi possível buscar os carros!\n\n Clique aqui para tentar novamente"),
          );
        }

        if (carros == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return _listaCarros(carros);
      },
    );
  }

  Container _listaCarros(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
        itemBuilder: (context, index) {
          Carro carro = carros[index];

          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      carro.urlFoto ??
                          "https://www.tribunadeituverava.com.br/wp-content/uploads/2017/12/sem-foto-sem-imagem-300x186.jpeg",
                      width: 250,
                    ),
                  ),
                  Text(
                    carro.nome ?? " - ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "descriçao...",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('DETALHES'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: const Text('SHARE'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
