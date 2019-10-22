import 'package:flutter/material.dart';
import '../models/beer.dart';

class BeerDetail extends StatelessWidget {
  final Beer _beer;
  BeerDetail(this._beer);

  @override
  Widget build(BuildContext context) =>
      // Use the Todo to create the UI.
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_beer.name),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8, top: 20, left: 150),
              child: Row(children: <Widget>[
                Image.network(
                  _beer.image_url,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.2,
                  fit: BoxFit.fill,
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    /*1*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*2*/
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            _beer.tagline,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          _beer.description,
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Text(
                          'IBU: ${_beer.ibu}'.toString(),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
