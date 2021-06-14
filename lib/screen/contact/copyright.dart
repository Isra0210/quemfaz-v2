import 'package:flutter/material.dart';

class CopyRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.copyright, color: Colors.white, size: 20),
            Text(
              '2020 Todos os direitos reservados, Quem Faz.',
              style:  TextStyle(fontSize: 12.0, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
