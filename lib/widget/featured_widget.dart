import 'package:flutter/material.dart';
import 'package:quemfaz/controller/controller.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:quemfaz/screen/provider/provider_home_screen.dart';
import 'package:quemfaz/widget/segment_widget.dart';
import 'package:quemfaz/widget/text_title_widget.dart';

class FeaturedWidget extends StatefulWidget {
  final List<Prestadores> providerList;
  final bool isDrag;

  FeaturedWidget({this.providerList, this.isDrag});

  @override
  _FeaturedWidgetState createState() => _FeaturedWidgetState();
}

class _FeaturedWidgetState extends State<FeaturedWidget> {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            widget.isDrag ? Container() : TextTitleWidget(text: "Destaques"),
            Container(
              height: 120,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: widget.providerList.map(
                  (provider) {
                    if (provider.periodo.toLowerCase() == "anual") {
                      return GestureDetector(
                        onTap: controller.hasNullDataProviderController(provider)
                          ? () => controller.showControllerModal(context: context)
                          : () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProviderHomeScreen(provider: provider)),
                            ),
                        child: SegmentWidget(nome: provider.nomeFantasia, foto: provider.logoUrl, isFeatured: true,),
                      );
                    } else {
                      return Container();
                    }
                  },
                ).toList(),
              ),
            ),
            SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}
