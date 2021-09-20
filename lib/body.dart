import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'controller.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.instance<Controller>();

    _textField(
        {String? labelText, onChanged, required String? Function() errorText}) {
      return TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText() == null ? null : errorText(),
        ),
      );
    }

    return Padding(
      padding: EdgeInsetsDirectional.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (_) {
              return _textField(
                  labelText: "Nome",
                  onChanged: controller.client.changeName,
                  errorText: controller.validateName);
            }),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Observer(builder: (_) {
              return _textField(
                  labelText: "Email",
                  onChanged: controller.client.changeEmail,
                  errorText: controller.validateEmail);
            }),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Observer(builder: (_) {
              return ElevatedButton(
                  onPressed: controller.isValid
                      ? () {
                          print('acao do botão valido');
                        }
                      : null,
                  child: Text("Salvar"));
            }),
          ],
        ),
      ),
    );
  }
}
