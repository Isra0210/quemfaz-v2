import 'package:flutter/material.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:quemfaz/screen/provider/widget/only_provider_widget.dart';

class ProviderListWidget extends StatefulWidget {
  final String segmentfilter;
  final List<Prestadores> providerList;

  ProviderListWidget({
    @required this.segmentfilter,
    @required this.providerList,
  });

  @override
  _ProviderListWidgetState createState() => _ProviderListWidgetState();
}

class _ProviderListWidgetState extends State<ProviderListWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.providerList.map(
          (provider) {
            return Column(
              children: provider.segmentos.where(
                (filter) {
                  String providerFilterSegment = filter.nome;
                  return providerFilterSegment.toLowerCase().contains(widget.segmentfilter.toLowerCase());
                },
              ).map(
                (_) {
                  return OnlyProviderWidget(provider: provider);
                },
              ).toList(),
            );
          },
        ).toList(),
      ),
    );
  }
}
