import 'package:flutter/material.dart';
import 'package:quemfaz/widget/drawer_widget.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonWidget extends StatefulWidget {
  @override
  _SkeletonWidgetState createState() => _SkeletonWidgetState();
}

class _SkeletonWidgetState extends State<SkeletonWidget> {
  _shimmerText() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 12.0, left: 10.0, bottom: 5.0),
      height: 24.0,
      width: 130.0,
    );
  }

  _shimmerSegment() {
    return Container(
      padding: EdgeInsets.only(left: 12.0, top: 12.0, bottom: 5.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(),
              color: Colors.grey[200],
            ),
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }

  _shimmerProvider() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
                border: Border.all(color: Color.fromRGBO(101, 5, 166, 0.64)),
                color: Colors.grey[700],
              ),
              height: 100,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              border: Border.all(color: Color.fromRGBO(101, 5, 166, 0.64)),
              color: Colors.white,
            ),
            margin: EdgeInsets.only(top: 16.0),
            height: 70,
            width: 80,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
            onPressed: () {}
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey[400],
        child: SingleChildScrollView(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerText(),
                  Row(
                    children: [
                      _shimmerSegment(),
                      SizedBox(width: 6.0),
                      _shimmerSegment(),
                      SizedBox(width: 6.0),
                      _shimmerSegment(),
                    ],
                  ),
                  _shimmerText(),
                  Column(
                    children: [
                      _shimmerProvider(),
                      _shimmerProvider(),
                      _shimmerProvider(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        period: Duration(milliseconds: 1000),
      ),
    );
  }
}
