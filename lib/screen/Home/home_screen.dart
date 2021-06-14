import 'package:flutter/material.dart';
import 'package:quemfaz/controller/controller.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:quemfaz/screen/Home/home_settings_screen.dart';
import 'package:quemfaz/screen/error/not_connected.dart';
import 'package:quemfaz/screen/provider/widget/provider_list_widget.dart';
import 'package:quemfaz/screen/search/search_screen.dart';
import 'package:quemfaz/widget/drawer_widget.dart';
import 'package:quemfaz/widget/featured_providers_widget.dart';
import 'package:quemfaz/widget/segment_widget.dart';
import 'package:quemfaz/widget/text_title_widget.dart';

class HomeScreen extends StatelessWidget {
  final SegmentAndProvider segmentAndProvider;
  final Controller controller = Controller();

  HomeScreen({@required this.segmentAndProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Quem Faz',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.cached),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeSettingScreen()),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: segmentAndProvider == null
                ? () => controller.openSnackBarController(
                      context: context,
                      color: Colors.red,
                      text: "Verifique sua conexão!",
                    )
                : () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                            providerList: segmentAndProvider.prestadores,
                            segmentList: segmentAndProvider.segmentos),
                      ),
                    ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: segmentAndProvider == null
            ? NotConnected()
            : Container(
                child: DefaultTabController(
                  length: segmentAndProvider.segmentos.length,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: TextTitleWidget(text: 'Segmento'),
                      ),
                      TabBar(
                        indicatorColor: Colors.orange,
                        isScrollable: true,
                        unselectedLabelColor: Colors.orange,
                        labelColor: Colors.white,
                        tabs: segmentAndProvider.segmentos.map(
                          (segmentItem) {
                            return SegmentWidget(
                              nome: segmentItem.nome,
                              foto: segmentItem.fotoUrl,
                              isFeatured: false,
                            );
                          },
                        ).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: TextTitleWidget(text: 'Prestadores'),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: TabBarView(
                          children: segmentAndProvider.segmentos.map(
                            (segment) {
                              return SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 40.0),
                                  child: ProviderListWidget(
                                    segmentfilter: segment.nome,
                                    providerList: segmentAndProvider.prestadores,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      bottomSheet: segmentAndProvider != null
        ? FeaturedProvidersWidget(
            providersFeatured: segmentAndProvider.prestadores,
          )
        : Container(height: 0),
    );
  }
}
