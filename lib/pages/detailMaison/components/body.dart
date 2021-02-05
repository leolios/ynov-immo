import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ynov_immo/pages/home/home-screen.dart';
import 'package:ynov_immo/constants.dart';
import 'package:ynov_immo/pages/details/components/item_image.dart';
import 'package:ynov_immo/pages/details/components/order_button.dart';
import 'package:ynov_immo/pages/details/components/title_price_rating.dart';

class RealEstateData {
    final int id;
    final int idUser;
    final String accroche;
    final String type;
    final int nbRooms;
    final int nbBedroom;
    final String description;
    final int size;
    final int price;
    final String address;
    final String zipCode;
    final String city;
    final String latitude;
    final String longitude;
    final String energyClass;
    final String gesClass;
    final int hasGarden;
    final int hasExposedStone;
    final int hasCimentTiles;
    final int hasParquetFloor;

    RealEstateData(this.id, this.idUser, this.accroche, this.type, this.nbRooms, this.nbBedroom, this.description, this.size, this.price,
        this.address, this.zipCode, this.city, this.latitude, this.longitude, this.energyClass, this.gesClass, this.hasGarden, this.hasExposedStone,
        this.hasCimentTiles, this.hasParquetFloor
        );
}

class Body extends StatelessWidget {
  final RealEstateData realEstateData;

  Body({Key key, @required this.realEstateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ItemInfo(realEstateData: realEstateData),
        ),
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  final RealEstateData realEstateData;

  ItemInfo({Key key, @required this.realEstateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Container(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: [1,2,3,4,5].map((i) { //todo url api route /real-estate-image
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: Image.network('https://picsum.photos/250?image=9')
                        );
                        },
                    );
                  }).toList(),
                ),

                Container (
                  padding: const EdgeInsets.all(3.0),
                  child: new Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                          child: new Text(realEstateData.type,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
                          )
                      ),

                      SizedBox(width: 20),

                      GestureDetector(
                          child: new Text(realEstateData.price.toString() + " €",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                          )
                      ),
                    ],
                  ),
                ),

                Container (
                  padding: const EdgeInsets.all(3.0),
                  child: new Row (
                    children: <Widget>[
                      Text(
                        'Critères :',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                Container (
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(3.0),
                  child: new Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Icon(Icons.kitchen, color: Colors.white),
                            Text(realEstateData.size.toString() + " m²",
                                style: TextStyle(color: Colors.white)
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(Icons.room, color: Colors.white),
                            Text(realEstateData.nbRooms.toString() + " pieces",
                                style: TextStyle(color: Colors.white)
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(Icons.outdoor_grill, color: Colors.white),
                            Text(realEstateData.hasGarden.toString() + " Jardin",
                                style: TextStyle(color: Colors.white)
                            ),
                          ],
                        ),
                      ]
                  ),
                ),

                Container (
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(3.0),
                  child: new Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(realEstateData.accroche,
                          style: TextStyle(color: Colors.white)
                      ),
                    ],
                  ),
                ),

                Container (
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(3.0),
                  child: new Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Icon(Icons.eco, color: Colors.white),
                            Text("Classe énergie: " + realEstateData.energyClass,
                                style: TextStyle(color: Colors.green)
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(Icons.gesture, color: Colors.white),
                            Text("GES: " + realEstateData.gesClass,
                                style: TextStyle(color: Colors.green)
                            ),
                          ],
                        ),
                      ]
                  ),
                ),


                Container (
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(3.0),
                  child: new Row (
                    children: <Widget>[
                      Text(
                          'Description :',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                          textAlign: TextAlign.left
                      ),
                    ],
                  ),
                ),

                Container (
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(3.0),
                  child: new Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text (realEstateData.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)
                      ),
                    ],
                  ),
                ),

                Container (
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(3.0),
                  child: new Row (
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white),
                      Text(realEstateData.address,
                          style: TextStyle(color: Colors.white)
                      ),
                    ],
                  ),
                ),
          ]
        )
      )
    );
  }
}
