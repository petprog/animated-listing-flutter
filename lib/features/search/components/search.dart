import 'package:flutter/material.dart';
import 'package:place_ui/features/search/components/map_options.dart';
import 'package:place_ui/features/search/components/map_viewer.dart';
import 'package:place_ui/features/search/components/position_markers.dart';
import 'package:place_ui/features/search/components/search_form.dart';
import 'package:place_ui/utils/screen_utils.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    )..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MapViewer(),
        Positioned(
          top: 160,
          left: 70,
          right: 70,
          child: SizedBox(
              height: context.screenHeight * 0.45,
              child: const PositionMarkers()),
        ),
        Positioned(
          top: 10,
          left: 25,
          right: 25,
          child: SearchForm(
            formKey: _formKey,
            scaleAnimation: _scaleAnimation,
          ),
        ),
        Positioned(
          bottom: 100,
          left: 30,
          right: 30,
          child: MapOptions(
            scaleAnimation: _scaleAnimation,
          ),
        ),
      ],
    );
  }
}
