
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MasjidsMapScreen extends StatefulWidget {
  @override
  _MasjidsMapScreenState createState() => _MasjidsMapScreenState();
}

class _MasjidsMapScreenState extends State<MasjidsMapScreen> {


  var utils = AppUtils();

  Completer<GoogleMapController> _controller = Completer();
  var mapController;

  Map<MarkerId, Marker> markers = {};
  double _originLatitude =31.468714, _originLongitude =74.317663;

  String googleAPiKey = googleMapKey;

  var currentPosition;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    currentPosition = CameraPosition(
      target: LatLng(_originLatitude,_originLongitude),
      zoom: 15.0,
    );
    getNearbyMosques(_originLatitude,_originLongitude);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: InkWell(
      //   onTap: (){_moveToCurrentLocation();},
      //   child: Container(
      //     padding: EdgeInsets.all(7),
      //     decoration: BoxDecoration(color: whiteColor,shape: BoxShape.circle),
      //     child: Icon(Icons.my_location,color: yellowLightColor,size: 20,),
      //   ),
      // ),
      backgroundColor: greenColor.withOpacity(.1),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                child:  GoogleMap(
                  markers: Set<Marker>.of(markers.values),
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  initialCameraPosition: currentPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),

              Positioned(
                  left: 15,
                  right: 15,
                  top: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              children: [
                                InkWell(
                                  // onTap: (){Navigator.pop(context);},
                                  child: Row(
                                    children: [
                                      Icon(Icons.chevron_left_rounded,color: greenDarkColor,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Text("Masjid",style : utils.subTitleTextStyle(greenDarkColor)),
                            ),
                            Container(
                              child: Text(""),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 25,
                  child:places==null?CupertinoActivityIndicator():Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for(var item in places)
                          mechDetails(item)
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  mechDetails(Place place)
  {
    return Container(
      height: 110,
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 250,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              width: 100,
              height: double.infinity,
              child: Image.network(
                place.image != null?"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="+place.image+"&key=$googleAPiKey"
                : "https://images.pexels.com/photos/337901/pexels-photo-337901.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(place.name,style: utils.labelTextStyle(greenDarkColor),),
                    SizedBox(height: 4,),
                    Wrap(
                      children: [
                        Container(
                            decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),color: greenDarkColor),
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 1),
                            child: Wrap(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.my_location,color: whiteColor,size: 15,),
                                    SizedBox(width: 2,),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(place.vicinity,style: utils.smallTextStyle(whiteColor),overflow: TextOverflow.fade,maxLines: 1,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),

                  ],
                )
            ),
            Container(
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(shape: BoxShape.circle,color: whiteColor),
              child: Center(child: Icon(CupertinoIcons.text_bubble,size: 20,color: whiteColor,)),
            )
          ],
        ),
      ),
    );
  }

 var places;
  getNearbyMosques(lat,lng) async {
    var uri = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?&location=$lat,$lng&type=mosque&rankby=distance&key=$googleMapKey');
    print(uri.toString());
    var response = await http.get(uri);
      print(response.body);
      var json = convert.jsonDecode(response.body);
      var jsonResults = json['results'] as List;
    places = jsonResults.map((place) => Place.fromJson(place)).toList();

    // List<Place> places2;
    // for(var item in places)
    //   {
    //     var uri = Uri.parse('https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$item.&key=$googleMapKey');
    //     print(uri.toString());
    //     var response = await http.get(uri);
    //     print(response.body);
    //     var json = convert.jsonDecode(response.body);
    //     []
    //   }
    //
    // places = places2;
    setState(() {});
    }

}




class Place{
  final String name;
  final double rating;
  final int userRatingCount;
  final String vicinity;
  final Geometry geometry;
  final String image;

  Place({required this.geometry, required this.name, required this.rating, required this.userRatingCount, required this.vicinity,required this.image});

  Place.fromJson(Map<dynamic, dynamic> parsedJson)
      :name = parsedJson['name'],
        rating = (parsedJson['rating'] !=null) ? parsedJson['rating'].toDouble() : null,
        userRatingCount = (parsedJson['user_ratings_total'] != null) ? parsedJson['user_ratings_total'] : null,
        vicinity = parsedJson['vicinity'],
        image = parsedJson['photos']==null
            ?null
            :parsedJson['photos'][0]["photo_reference"],
        geometry = Geometry.fromJson(parsedJson['geometry']);


}

class Geometry {
  final Location location;

  Geometry({required this.location});

  Geometry.fromJson(Map<dynamic,dynamic> parsedJson)
      :location = Location.fromJson(parsedJson['location']);
}

class Location{
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  Location.fromJson(Map<dynamic,dynamic> parsedJson)
      :lat = parsedJson['lat'],
        lng = parsedJson['lng'];
}
