import 'package:flutter/material.dart';
import 'package:quemfaz/controller/controller.dart';
import 'package:quemfaz/models/segment_provider_model.dart';
import 'package:quemfaz/screen/Home/home_screen.dart';
import 'package:quemfaz/screen/error/not_connected.dart';

import 'package:quemfaz/widget/skeleton_widget.dart';

class HomeSettingScreen extends StatefulWidget {
  @override
  _HomeSettingScreenState createState() => _HomeSettingScreenState();
}

class _HomeSettingScreenState extends State<HomeSettingScreen> {
  final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getAllRequesController(),
      builder: (context, snapshot) {
        SegmentAndProvider segmentAndProvider = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return HomeScreen(segmentAndProvider: null);
            break;
          case ConnectionState.waiting:
            return SkeletonWidget();
            break;
          default:
            if (snapshot.hasError) {
              return NotConnected(error: snapshot.error);
            } else {
              return HomeScreen(segmentAndProvider: segmentAndProvider);
            }
        }
      },
    );
  }
}
