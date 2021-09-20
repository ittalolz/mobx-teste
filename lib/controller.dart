import 'package:mobx/mobx.dart';
import 'package:mobx_curso/models/client.dart';

part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }

  String? validateName() {
    if (client.name != null) {
      if (client.name!.isNotEmpty) return null;
    }
    return 'Campo obrigatório';
  }

  String? validateEmail() {
    if (client.email == null || client.email!.isEmpty) {
      return 'Campo Obrigatório';
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(client.email!)) {
      return 'Email inválido';
    }

    return null;
  }
}
