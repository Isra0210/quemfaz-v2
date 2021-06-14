import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:shimmer/shimmer.dart';

class CarroselImageWidget extends StatelessWidget {
  final List<Foto> images;

  CarroselImageWidget({@required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          child: Carousel(
            images: images.map((img) => Image.network('${img.fotoUrl}', fit: BoxFit.cover)).toList(),
            defaultImage: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey[300],
              child: Image.asset("assets/new-logo.png"),
            ),
            autoplay: false,
            dotSize: 7.0,
            dotSpacing: 16.0,
            dotColor: Colors.orange,
            indicatorBgPadding: 7.0,
            dotBgColor: Theme.of(context).primaryColor,
            borderRadius: true,
            noRadiusForIndicator: true,
          ),
        ),
      ),
    );
  }
}
