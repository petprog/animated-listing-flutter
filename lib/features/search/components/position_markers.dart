import 'package:flutter/material.dart';
import 'package:place_ui/features/search/components/marker.dart';

class PositionMarkers extends StatelessWidget {
  const PositionMarkers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          left: 20,
          child: Marker(
            text: "7,3 mn P",
          ),
        ),
        Positioned(
          top: 55,
          left: 30,
          child: Marker(
            text: "4,6 mn P",
          ),
        ),
        Positioned(
          top: 65,
          right: 0,
          child: Marker(
            text: "9,8 mn P",
          ),
        ),
        Positioned(
          top: 170,
          right: 0,
          child: Marker(
            text: "6,5 mn P",
          ),
        ),
        Positioned(
          top: 190,
          child: Marker(
            text: "4,10 mn P",
          ),
        ),
        Positioned(
          bottom: 0,
          right: 30,
          child: Marker(
            text: "9,2 mn P",
          ),
        ),
      ],
    );
  }
}
