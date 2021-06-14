import 'package:flutter/material.dart';

class SegmentWidget extends StatelessWidget {
  final String nome;
  final String foto;
  final bool isFeatured;

  SegmentWidget({
    @required this.nome,
    @required this.foto,
    @required this.isFeatured,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isFeatured ? 10.0 : 0.0, vertical: isFeatured ? 1.0 : 0.0),
      child: Stack(
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal: isFeatured ? 10.0 : 0.0, vertical: isFeatured ? 2.0 : 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Theme.of(context).primaryColor),
              image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(foto)),
              color: Colors.white,
            ),
            height: isFeatured ? 80 : 100,
            width: 100,
          ),
          Container(
            padding: EdgeInsets.only(top: isFeatured ? 80.0 : 100.0),
            child: Container(
              width: 100,
              height: isFeatured ? 38 : 36,
              child: Center(
                child: Text(
                  nome,
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
