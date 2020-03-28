import 'package:flutter_app_mobx_exemple/service/carro_service.dart';
import 'package:mobx/mobx.dart';

import 'carro.dart';

/*
 * Business Logic Component
 * Classe com a logica de negócios (utilizando programação reativa (streams))
 */
part 'carros_model.g.dart';

class CarrosModel = CarrosModelBase with _$CarrosModel;

abstract class CarrosModelBase with Store {

  @observable
  List<Carro> carros;

  @observable
  Exception error;
  
  // Busca os carros da API
  @action
  fetch() async {
    try {
      error = null;
      this.carros = await CarroService.getCarros();
    } catch(e) {
      this.error = e;
    }
  }

}
