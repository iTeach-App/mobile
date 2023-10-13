import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:latlong2/latlong.dart' as latlong;


class MapboxStaticMap extends StatefulWidget {
  @override
  MapboxStaticMapState createState() => MapboxStaticMapState();
}

class MapboxStaticMapState extends State<MapboxStaticMap> {
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  LatLng? center = LatLng(0, 0); // Default center

  @override
  Widget build(BuildContext context) {

    // Retrieve the Mapbox access token from the environment variables
    final String mapboxAccessToken = dotenv.env['mapbox_public_key'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapbox Static Map'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: latitudeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Latitude'),
            ),
            TextField(
              controller: longitudeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Longitude'),
            ),
            ElevatedButton(
              onPressed: () {
                double latitude = double.tryParse(latitudeController.text) ?? 0;
                double longitude = double.tryParse(longitudeController.text) ?? 0;

                if (latitude >= -90 && latitude <= 90 && longitude >= -180 && longitude <= 180) {
                  setState(() {
                    center = LatLng(latitude, longitude);
                  });
                } else {
                  // Handle invalid input
                }
              },
              child: Text('Show Map'),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: center,
                  zoom: 10.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                    'https://api.mapbox.com/styles/v1/dallerivemiki/tiles/{z}/{x}/{y}?access_token=QUI_VA_ADDATO_IL_PUBLIC_TOKEN_IN_TEORIA_ZIOPERA',
                    additionalOptions: {
                      'accessToken': const String.fromEnvironment('PUBLIC_TOKEN'),
                      'id': 'mapbox.mapbox-streets-v8'
                    }
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: center,
                        builder: (context) => Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: MapboxStaticMap(),
));