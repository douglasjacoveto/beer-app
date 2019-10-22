import 'package:flutter/material.dart';
import '../repository/beer_repository.dart';
import '../models/beer.dart';
import '../widgets/beerTile.dart';

class BeerScreen extends StatefulWidget {
  @override
  _BeerState createState() => _BeerState();
}

class _BeerState extends State<BeerScreen> {
  List<Beer> _beers = <Beer>[];

  @override
  void initState() {
    super.initState();
    listenForBeers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Top Beers'),
        ),
        body: ListView.builder(
          itemCount: _beers.length,
          itemBuilder: (context, index) => BeerTile(_beers[index]),
        ),
      );

  void listenForBeers() async {
    final Stream<Beer> stream = await getBeers();
    stream.listen((Beer beer) => setState(() => _beers.add(beer)));
  }
}
