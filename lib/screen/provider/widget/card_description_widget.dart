import 'package:flutter/material.dart';
import 'package:quemfaz/widget/text_title_widget.dart';

class CardDescriptionWidget extends StatelessWidget {
  final String titulo;
  final String descricao;

  CardDescriptionWidget({@required this.titulo, @required this.descricao});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitleWidget(text: '$titulo'),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12.0, right: 12.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.white12,
              ),
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  descricao,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
