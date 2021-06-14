import 'package:flutter/material.dart';
import 'package:quemfaz/controller/controller.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:quemfaz/screen/provider/widget/card_description_widget.dart';
import 'package:quemfaz/screen/provider/widget/carrosel_image_widget.dart';
import 'package:quemfaz/screen/provider/widget/contact_company_widget.dart';
import 'package:quemfaz/screen/provider/widget/segment_company_widget.dart';

class ProviderHomeScreen extends StatelessWidget {
  ProviderHomeScreen({@required this.provider});
  final Controller controller = Controller();

  final Prestadores provider;
  final Border border = Border.all(
    color: Color.fromRGBO(101, 5, 166, 0.64),
  );

  final List<String> companyTagInformation = [
    'Sobre a empresa',
    'Galeria',
    'Segmentos',
    'Contato'
  ];

  isEmpty({String texto}) {
    return Center(
      child: Text(texto, style: TextStyle(color: Colors.white, fontSize: 30.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          '${provider.nomeFantasia}',
          style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w400),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: DefaultTabController(
        length: companyTagInformation.length,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/imgdefault.jpg',
                      image: '${controller.getImageCover(provider) == "" ? provider.logoUrl : controller.getImageCover(provider)}',
                      height: 150.0,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholderCacheHeight: 100,
                      placeholderCacheWidth: 100,
                    ),
                  ),
                  provider.logoUrl.length > 1
                      ? Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 30.0),
                          child: Container(
                            padding: EdgeInsets.only(top: 5.0),
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 50.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.black38,
                              border: border,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Theme.of(context).backgroundColor,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage('${provider.logoUrl}'),
                                    ),
                                  ),
                                  height: 70,
                                  width: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    '${provider.nomeFantasia}',
                                    style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 70.0, bottom: 30.0),
                          child: Container(
                            padding: EdgeInsets.only(top: 5.0),
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 50.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.black38,
                              border: border,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: border,
                                    color: Colors.deepPurpleAccent[700],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${provider.logoUrl}',
                                      style: TextStyle(fontSize: 32.0, color: Colors.white),
                                    ),
                                  ),
                                  height: 70,
                                  width: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    '${provider.nomeFantasia}',
                                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
            TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 18.0),
              indicatorColor: Colors.orange,
              tabs: companyTagInformation.map((item) => Tab(text: item)).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CardDescriptionWidget(titulo: 'Descrição',descricao: provider.descricao),
                          CardDescriptionWidget(titulo: 'Especialização',descricao: provider.especializacao),
                          CardDescriptionWidget(titulo: 'Diferenciais',descricao: provider.diferenciais),
                        ],
                      ),
                    ),
                  ),
                  provider.fotos.length > 0
                    ? CarroselImageWidget(images: provider.fotos)
                    : isEmpty(texto: 'Não há imagem!'),
                  Container(
                    child: SingleChildScrollView(
                      child: SegmentCompanyWidget(segment: provider.segmentos)
                    ),
                  ),
                  provider.contatos.length > 0
                    ? ContactCompanyWidget(contact: provider.contatos)
                    : isEmpty(texto: 'Não há contatos para mostrar!'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
