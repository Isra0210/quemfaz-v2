import 'package:flutter/material.dart';

class WhoWeAreScreen extends StatelessWidget {
  final whoWeAreInformation = [
    {
      "title": "História",
      "description": "A plataforma Quem-Faz foi idealizada a partir de uma grande demanda por profissionais de qualidade no mercado da construção civil e industrial. Com esta demanda, surgimos para facilitar a busca por estes profissionais e elevar o alcance das empresas parceiras.",
    },
    {
      "title": "Missão",
      "description": "Ser a conexão entre consumidores e empresas qualificadas do ramo da construção civil e industrial. Desta forma, viabilizando a busca por prestadores de serviço qualificado e expandindo o alcance das empresas associadas.",
    },
    {
      "title": "Visão",
      "description": "Tornar-se referência na busca de serviços na área de construção civil e industrial. Colaborando com o crescimento das empresas e na satisfação dos clientes pelos prestadores associados a plataforma Quem-faz.",
    },
    {
      "title": "Valores",
      "description": "Integridade, honestidade, comprometimento com parceiros e clientes, qualidade, excelência e inovação.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0, left: 2.0, right: 2.0),
              child: Text(
                'Quem somos',
                style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Column(
            children: whoWeAreInformation.map((item) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Stack(
                  children: [
                    Container(
                      child: Container(
                        margin: EdgeInsets.only(top: 16.0),
                        padding: EdgeInsets.all(10),
                        color: Colors.black,
                        child: Text('${item["description"]}', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      child: Text(
                        '${item["title"]}',
                        style: TextStyle(color: Colors.orange, fontSize: 26.0, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
