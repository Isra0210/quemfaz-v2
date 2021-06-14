import 'package:flutter/material.dart';
import 'package:quemfaz/controller/controller.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:quemfaz/utils/contants.dart';

class ContactCompanyWidget extends StatefulWidget {
  final List<Contato> contact;

  ContactCompanyWidget({@required this.contact});

  @override
  _ContactCompanyWidgetState createState() => _ContactCompanyWidgetState();
}

class _ContactCompanyWidgetState extends State<ContactCompanyWidget> {
  Controller controller = Controller();

  _entriesContact(Contato contact) {
    switch (contact.label.toLowerCase()) {
      case 'telefone':
        return controller.openBrowserController(url: "tel:${contact.valor}");
        break;
      case 'celular':
        return controller.openBrowserController(url: "tel:${contact.valor}");
        break;
      case 'whatsapp':
        return controller.openBrowserController(url: '$URL_WHATS/send?phone=55${contact.valor}');
        break;
      case 'instagram':
        return controller.openBrowserController(
          url: contact.valor.contains('@') 
            ? '$URL_INSTA/${contact.valor.replaceAll(RegExp('\@'), '')}'
            : '$URL_INSTA/${contact.valor}',
          );
        break;
      case 'email':
        return controller.openBrowserController(url: 'mailto:${contact.valor}');
        break;
      case 'facebook':
        return controller.openBrowserController(url: contact.valor.contains('http') ? contact.valor : '$URL_FB/${contact.valor}');
        break;
      case 'site':
        return controller.openBrowserController(
          url: contact.valor.contains('www') 
          ? 'http://${contact.valor.substring(4)}' 
          : '${contact.valor}'
        );
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(101, 5, 166, 0.64))),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: widget.contact.map(
            (contactItem) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: GestureDetector(
                  onTap: () => _entriesContact(contactItem),
                  child: Row(
                    children: [
                      Icon(Icons.public, color: Colors.orange),
                      SizedBox(width: 4.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.72,
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          '${contactItem.valor}',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
