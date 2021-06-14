import 'package:flutter/material.dart';
import 'package:quemfaz/controller/controller.dart';
import 'package:quemfaz/screen/provider/provider_home_screen.dart';

class OnlyProviderWidget extends StatelessWidget {
  final Controller controller = Controller();
  final provider;

  OnlyProviderWidget({@required this.provider});

  @override
  Widget build(BuildContext context) {
    _border() {
      return Border.all(color: Theme.of(context).backgroundColor);
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            child: GestureDetector(
              onTap: controller.hasNullDataProviderController(provider)
                  ? () => controller.showControllerModal(context: context)
                  : () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProviderHomeScreen(provider: provider),
                        ),
                      ),
              child: Container(
                margin: EdgeInsets.only(left: 30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                    border: Border.all(color: Theme.of(context).backgroundColor),
                    image: provider.descricaoPrevia == null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/fundoConstruindo.jpg'),
                        )
                      : null,
                    color: provider.descricaoPrevia != null
                      ? Colors.grey[800]
                      : Colors.transparent,
                  ),
                  height: 100,
                  width: 500,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(
                            '${provider.nomeFantasia}',
                            style: TextStyle(fontSize: 16.0, color: Colors.orange),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            left: 60.0,
                            right: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              provider.descricaoPrevia != null
                                ? Container(
                                    width: MediaQuery.of(context).size.width * 0.52,
                                    child: Text(
                                      '${provider.descricaoPrevia}',
                                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  )
                                : Container(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      'EM BREVE',
                                      style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow[700],
                                      ),
                                    ),
                                  ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Icon(Icons.arrow_right_alt_outlined, size: 40.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          provider.logoUrl.length > 1
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  border: _border(),
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${provider.logoUrl}'),
                  ),
                ),
                margin: EdgeInsets.only(top: 16.0),
                height: 70,
                width: 80,
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  border: _border(),
                  color: Colors.deepPurpleAccent[700],
                ),
                child: Center(
                  child: Text(
                    '${provider.logoUrl}',
                    style: TextStyle(fontSize: 32.0, color: Colors.white),
                  ),
                ),
                margin: EdgeInsets.only(top: 16.0),
                height: 70,
                width: 80,
              ),
        ],
      ),
    );
  }
}
