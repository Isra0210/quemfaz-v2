import 'package:flutter/material.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:quemfaz/screen/Home/home_screen.dart';
import 'package:quemfaz/screen/search/search_provider.dart';

class SearchScreen extends StatefulWidget {
  final List<Segmento> segmentList;
  final List<Prestadores> providerList;

  SearchScreen({@required this.segmentList, @required this.providerList});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String busca = "";

  Widget _buscaWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: TextField(
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            busca = value;
          });
        },
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
          enabledBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: 'Buscar segmento',
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Container(
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: widget.segmentList
              .where(
                (filter) {
                  String segmentFilterName = filter.nome;
                  return segmentFilterName.toLowerCase().contains(busca.toLowerCase());
                },
              )
              .toList()
              .map(
                (item) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: widget.providerList == null ||widget.segmentList == null
                        ? () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen(segmentAndProvider: null),
                              ),
                            )
                        : () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchProvider(filter: item.nome,providerList: widget.providerList),
                              ),
                            ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: NetworkImage('${item.thumb}'),
                              radius: 40.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                '${item.nome}',
                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
          ),
        ),
      ),
    );
  }
}
