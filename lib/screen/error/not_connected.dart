import 'package:flutter/material.dart';

class NotConnected extends StatelessWidget {
  final String error;

  NotConnected({
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 120.0, left: 10.0, right: 10.0),
      color: Theme.of(context).primaryColor,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.36,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                error ?? "Verifique sua conexão, ou tente mais tarde!",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
