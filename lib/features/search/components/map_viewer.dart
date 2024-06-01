import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_ui/features/search/map_styles.dart';

class MapViewer extends StatefulWidget {
  const MapViewer({super.key});

  @override
  State<MapViewer> createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.86, 151.20);

  // final Set<Marker> _markers = {
  //   Marker(
  //     markerId: const MarkerId('marker_1'),
  //     position: const LatLng(-33.86, 151.20),
  //     infoWindow: const InfoWindow(
  //       title: 'Sydney Opera House',
  //       snippet: 'An iconic landmark in Sydney',
  //     ),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  //   Marker(
  //     markerId: const MarkerId('marker_2'),
  //     position: const LatLng(-33.87, 151.21),
  //     infoWindow: const InfoWindow(
  //       title: 'Sydney Harbour Bridge',
  //       snippet: 'A famous bridge in Sydney',
  //     ),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  // };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      style: style1,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      // markers: _markers,
    );
  }
}
