import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'contact_controller.g.dart';

class ContactController = _ContactControllerBase with _$ContactController;

abstract class _ContactControllerBase with Store {
  @observable
  bool edited = false;

  @observable
  bool isLoading = false;

  @observable
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @observable
  String name = '';
  @observable
  String phone = '';
  @observable
  String email = '';
  @observable
  String subjectMatter = '';
  @observable
  String text = '';

  @action
  void changeName(String newValue) {
    name = newValue;
    edited = true;
  }

  @action
  void changePhone(String newValue) {
    phone = newValue;
    edited = true;
  }

  @action
  void changeEmail(String newValue) {
    email = newValue;
    edited = true;
  }

  @action
  void changeSubjectMatter(String newValue) {
    subjectMatter = newValue;
    edited = true;
  }

  @action
  void changeText(String newValue) {
    text = newValue;
    edited = true;
  }

  @action
  String validateNumber(String value) {
    String newNumber = value.replaceAll(new RegExp(r'[^\w\s]+'), '');
    String newNumberFormatted = newNumber.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return "Campo obrigatório!";
    } else if (!regex.hasMatch(newNumberFormatted) || newNumberFormatted.length < 11) {
      return "Número inválido!";
    }
    return null;
  }

  @action
  String validateName(value) {
    if (value.isEmpty) {
      return "Campo obrigatório!";
    } else if (value.toString().length <= 3) {
      return "Nome deve conter mais de 3 caracteres!";
    }
    return null;
  }

  @action
  String validateEmail(value) {
    if (value.isEmpty) {
      return "Campo obrigatório!";
    } else if (!EmailValidator.validate(value)) {
      return " E-mail inválido!";
    }
    return null;
  }

  @action
  String validateText(value) {
    if (value.isEmpty) {
      return "Campo obrigatório!";
    }
    return null;
  }

  @action
  snackBarContactController({BuildContext context, String text, Color color}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 3),
        backgroundColor: color,
      ),
    );
  }

  @action
  Future<http.Response> sendMessageContact({BuildContext context}) async {
    http.Response response;
    try {
      response = await http.post(
        'https://app.quem-faz.com/mensagens',
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, String>{
          "nome": name,
          "email": email,
          "telefone": phone, 
          "assunto": subjectMatter,
          "descricao": text
        }),
      );
      if (response.statusCode == 200) {
        snackBarContactController(context: context, text: 'Enviado com sucesso', color: Colors.green);
      } else {
        snackBarContactController(
          context: context,
          text: 'Não foi possível enviar sua requisição!',
          color: Colors.red,
        );
      }
    } catch (error) {
      snackBarContactController(
        context: context,
        text: 'Verifique sua internet, não foi possível enviar sua requisição!',
        color: Colors.red,
      );
    }
  }

  @action
  validateForm({BuildContext context}) async {
    if (!form.currentState.validate()) {
      return;
    } else if (form.currentState.validate()) {
      isLoading = true;
      form.currentState.save();
      await sendMessageContact(context: context);
      isLoading = false;
    }
    isLoading = false;
    form.currentState.reset();
    edited = false;
  }

  @action
  Future<bool> requestPop(context) async {
    if (edited) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Descartar alterações?',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Se sair as alterações serão perdidas!',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar', style: TextStyle(color: Colors.orange)),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Descartar', style: TextStyle(color: Colors.orange)),
            ),
          ],
        ),
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
