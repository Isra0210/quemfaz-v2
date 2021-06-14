import 'package:flutter/material.dart';
import 'package:quemfaz/models/segment_provider_model.dart';

class SegmentCompanyWidget extends StatelessWidget {
  final List<Segmento> segment;

  SegmentCompanyWidget({@required this.segment});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: segment.map((seg) {
          return Container(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Column(
                  children: [
                    Icon(Icons.roofing, color: Colors.orange),
                    Text(
                      '${seg.nome}',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
