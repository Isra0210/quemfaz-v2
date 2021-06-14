import 'package:flutter/material.dart';
import 'package:quemfaz/controller/controller.dart';
import 'package:quemfaz/utils/contants.dart';
import 'package:quemfaz/widget/change_color_icon_widget.dart';

class SocialMedia extends StatelessWidget {

  final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Redes sociais',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: ChangeColorIconWidget(
                    child: Image.asset('assets/facebook.png', height: 39.0, width: 39.0),
                  ),
                  onTap: () => controller.openBrowserController(url: '$URL_FB/Quem-Faz-109836917563050/109836917563050'),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  child: ChangeColorIconWidget(
                    child: Image.asset('assets/instagram.png',height: 40, width: 40, fit: BoxFit.cover),
                  ),
                  onTap: () => controller.openBrowserController(url: '$URL_INSTA/quemfazoficial'),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  child: ChangeColorIconWidget(
                    child: Image.asset('assets/whatsapp.png',height: 40, width: 40, fit: BoxFit.cover)
                  ),
                  onTap: () => controller.openBrowserController(url: '$URL_WHATS/send?phone=5545991432599'),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
