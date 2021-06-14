import 'package:flutter/material.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:quemfaz/screen/provider/widget/only_provider_widget.dart';
import 'package:quemfaz/screen/provider/widget/provider_list_widget.dart';

class SearchProvider extends StatefulWidget {
  final String filter;
  final List<Prestadores> providerList;

  SearchProvider({@required this.filter, @required this.providerList});

  @override
  _SearchProviderState createState() => _SearchProviderState();
}

class _SearchProviderState extends State<SearchProvider> {
  String search = "";
  bool verifyLists;

  Widget _buscaWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: TextField(
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            search = value;
          });
        },
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: '${widget.filter}',
          hintStyle: TextStyle(color: Colors.grey[400]),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 3.0, left: 15.0),
            child: Icon(Icons.search, color: Colors.white, size: 20.0),
          ),
        ),
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buscaWidget(),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: search == ""
        ? ProviderListWidget(segmentfilter: widget.filter, providerList: widget.providerList)
        : SingleChildScrollView(
            child: Column(
              children: widget.providerList.map(
                (provider) {
                  return Column(
                    children: provider.segmentos.where(
                      (filter) {
                        String providerFilterSegment = filter.nome;
                        String providerFilterName = provider.nomeFantasia;
                        return providerFilterSegment.toLowerCase().contains(widget.filter.toLowerCase()) &&
                          providerFilterName.toLowerCase().contains(search.toLowerCase());
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
          ),
    );
  }
}
