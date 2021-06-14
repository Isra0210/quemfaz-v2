import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:quemfaz/controller/contact/contact_controller.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:quemfaz/utils/contants.dart';
import 'package:url_launcher/url_launcher.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  ContactController contactController = ContactController();

  @observable
  SegmentAndProvider allRequest;

  @action
  Future getAllRequesController() async {
    try {
      http.Response response;
      response = await http.get("$BASE_URL/pesquisa");
      allRequest = SegmentAndProvider.fromJson(jsonDecode(response.body));
      return allRequest;
    } catch (error) {
      return null;
    }
  }

  @action
  openSnackBarController({BuildContext context, Color color, String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(text, style: TextStyle(fontSize: 18.0)),
        duration: Duration(seconds: 2),
      ),
    );
  }

   void showControllerModal({BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Em breve!",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.close, color: Colors.white,),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
    );
  }

  @action
  openBrowserController({String url}) async {
    try {
      String newUrl = url;
      if (await canLaunch(newUrl)) {
        await launch(newUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (error) {
      print(error);
    }
  }

  @action
  bool hasNullDataProviderController(Prestadores provider) {
    if (provider.descricao == null ||
        provider.descricaoPrevia == null ||
        provider.diferenciais == null ||
        provider.especializacao == null ||
        provider.logoUrl == null) {
      return true;
    }
    return false;
  }

  String getImageCover(Prestadores provider) {
    String returningImage = "";
    provider.fotos.map((image) {
      if (image.capa == true) {
        returningImage = image.fotoUrl;
      }
    }).toList();

    return returningImage;
  }
}
