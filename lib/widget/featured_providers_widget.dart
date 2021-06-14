import 'package:flutter/material.dart';
import 'package:quemfaz/controller/controller.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:quemfaz/widget/featured_widget.dart';
import 'package:quemfaz/widget/text_title_widget.dart';

class FeaturedProvidersWidget extends StatefulWidget {
  final List<Prestadores> providersFeatured;

  FeaturedProvidersWidget({this.providersFeatured});

  @override
  _FeaturedProvidersWidgetState createState() =>
      _FeaturedProvidersWidgetState();
}

class _FeaturedProvidersWidgetState extends State<FeaturedProvidersWidget> {
  final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.28,
        minChildSize: 0.06,
        initialChildSize: 0.06,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    child: TextTitleWidget(text: "Destaques", alignment: Alignment.center),
                  ),
                  widget.providersFeatured != null
                    ? FeaturedWidget(providerList: widget.providersFeatured, isDrag: true)
                    : Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Algo deu errado :(",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
