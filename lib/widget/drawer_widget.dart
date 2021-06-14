import 'package:flutter/material.dart';
import 'package:quemfaz/controller/controller.dart';
import 'package:quemfaz/screen/contact/contact_screen.dart';
import 'package:quemfaz/screen/whoWeAre/who_we_are_screen.dart';

class DrawerWidget extends StatelessWidget {
  final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    _itemDrawer({IconData icon, String label, Function onTap}) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 3.0),
        child: Card(
          elevation: 8.0,
          child: ListTile(
            leading: Icon(icon, color: Colors.black),
            title: Text(label),
            onTap: onTap,
          ),
        ),
      );
    }

    return Drawer(
      child: Container(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Quem Faz', style: TextStyle(fontSize: 22.0, color: Colors.white)),
                            Spacer(),
                            Image.asset('assets/new-logo.png', height: 30.0),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.openBrowserController(url: 'https://quem-faz.com/');
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Icon(Icons.public, color: Colors.white),
                                  ),
                                  SizedBox(width: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.6),
                                    child: Text(
                                      'Ir para o site',
                                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _itemDrawer(
                icon: Icons.group,
                label: 'Quem somos',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WhoWeAreScreen()),
                  );
                },
              ),
              _itemDrawer(
                icon: Icons.contacts,
                label: 'Contato',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactScreen()),
                  );
                },
              ),
              _itemDrawer(
                icon: Icons.star,
                label: 'Qualificar no Play Store',
                onTap: () => controller.openBrowserController(url: "https://play.google.com/store/apps/details?id=br.com.quemfaz")
              ),
              Spacer(),
              Container(
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/jrim-logo.png', height: 20.0),
                          Text(
                            'JRIM',
                            style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      Text('v1.0.1', style: TextStyle(color: Colors.white, fontSize: 12.0)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
