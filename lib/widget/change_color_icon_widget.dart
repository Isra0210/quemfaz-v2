import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChangeColorIconWidget extends StatelessWidget {
  final Widget child;

  ChangeColorIconWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.white,
      child: child,
    );
  }
}
