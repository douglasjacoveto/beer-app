import 'package:flutter_beer/widgets/beerDetail.dart';
import 'package:flutter/material.dart';
import '../models/beer.dart';

class BeerTile extends StatelessWidget {
  final Beer _beer;
  BeerTile(this._beer);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ListTile(
            title: Text(_beer.name),
            subtitle: Text('${_beer.tagline} - IBU: ${_beer.ibu}'),
            leading: Container(
                margin: EdgeInsets.only(left: 6.0),
                child: Image.network(
                  _beer.image_url,
                  height: 50.0,
                  fit: BoxFit.fill,
                )),
            onLongPress: () {
              final snackBar = SnackBar(
                  content: Text('Description: ${_beer.description}'),
                  backgroundColor: Colors.black87);
              Scaffold.of(context).showSnackBar(snackBar);
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BeerDetail(_beer)),
              );
            },
          ),
          Divider()
        ],
      );
}
