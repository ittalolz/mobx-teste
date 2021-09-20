import 'package:mobx/mobx.dart';
import 'package:mobx_curso/models/client.dart';

part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{

  var client = Client();


  String? validateName() {
    if (client.name != null){
      if (client.name!.isNotEmpty)
        return null;
    }
    return 'Campo obrigatório';
  }

}


