import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final controller = Controller();

  _textField({String? labelText, onChanged, required String? Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText() == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
