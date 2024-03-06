import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late FirebaseFirestore firestore;

  Set<Marker> markers = Set<Marker>();

  @override
  void initState() {
    super.initState();

    // Initialize Firebase Firestore
    firestore = FirebaseFirestore.instance;

    // Retrieve data from Firebase Firestore
    retrieveData();
  }

  void retrieveData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('gps').get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> document
        in querySnapshot.docs) {
      double latitude = document['lat'] ?? 0.0;
      double longitude = document['longitude'] ?? 0.0;
      print(latitude);
      print(longitude);

      addMarker(latitude, longitude);
    }
  }

  void addMarker(double latitude, double longitude) {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId('$latitude-$longitude'),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(
          title: 'Location Marker',
          snippet: 'Lat: $latitude, Lng: $longitude',
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(27.700769, 85.300140), // Initial position
          zoom: 14.0,
        ),
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: markers,
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: Icon(Icons.my_location),
      ),
    );
  }
}

void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    }
    catch (e) {
      print("Error: $e");
    }
}
