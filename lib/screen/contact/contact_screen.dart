import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quemfaz/controller/controller.dart';
import 'package:quemfaz/screen/contact/copyright.dart';
import 'package:quemfaz/screen/contact/social_media.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _telefoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _assuntoFocusNode = FocusNode();
  final _textoFocusNode = FocusNode();
  final Controller controller = Controller();
  final _maskNumero = MaskTextInputFormatter(mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final textStyleWhite = TextStyle(color: Colors.white);

  String nome, assunto, descricao, email, telefone;

  _decorationInput(String label) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(101, 5, 166, 1)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(242, 159, 5, 1)),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(242, 159, 5, 1)),
      ),
      labelText: label,
      labelStyle: textStyleWhite,
      errorStyle: TextStyle(color: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.contactController.requestPop(context),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          titleSpacing: 0.0,
          title: Padding(
            padding:const EdgeInsets.only(bottom: 4.0, left: 2, right: 2.0),
            child: Text(
              'Contato',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: controller.contactController.form,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: TextFormField(
                            style: textStyleWhite,
                            validator: controller.contactController.validateName,
                            decoration: _decorationInput('Nome'),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_telefoneFocusNode),
                            onChanged: controller.contactController.changeName,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: TextFormField(
                            style: textStyleWhite,
                            validator:controller.contactController.validateNumber,
                            inputFormatters: [_maskNumero],
                            decoration: _decorationInput('Telefone'),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            focusNode: _telefoneFocusNode,
                            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_emailFocusNode),
                            onChanged: controller.contactController.changePhone,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: TextFormField(
                            style: textStyleWhite,
                            validator:controller.contactController.validateEmail,
                            decoration: _decorationInput('E-mail'),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white,
                            focusNode: _emailFocusNode,
                            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_assuntoFocusNode),
                            onChanged: controller.contactController.changeEmail,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: TextFormField(
                            style: textStyleWhite,
                            validator: controller.contactController.validateText,
                            decoration: _decorationInput('Assunto'),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            focusNode: _assuntoFocusNode,
                            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_textoFocusNode),
                            onChanged: controller.contactController.changeSubjectMatter,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: TextFormField(
                            style: textStyleWhite,
                            validator: controller.contactController.validateText,
                            decoration: _decorationInput('Texto'),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            focusNode: _textoFocusNode,
                            onChanged: controller.contactController.changeText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: Observer(
                      builder: (context) {
                        return RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.black87,
                          child: controller.contactController.isLoading
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.orange)),
                                )
                              : Text(
                                  'Enviar',
                                  style: TextStyle(color: Colors.orange, fontSize: 20),
                                ),
                          onPressed: controller.contactController.isLoading
                              ? null
                              : () => controller.contactController.validateForm(context: context)
                        );
                      },
                    ),
                  ),
                ),
                SocialMedia()
              ],
            ),
          ),
        ),
        bottomNavigationBar: CopyRight()
      ),
    );
  }
}
