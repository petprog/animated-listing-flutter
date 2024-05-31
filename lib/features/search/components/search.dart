import 'package:flutter/material.dart';
import 'package:place_ui/features/search/components/map_options.dart';
import 'package:place_ui/features/search/components/map_viewer.dart';
import 'package:place_ui/features/search/components/search_form.dart';

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
      duration: const Duration(seconds: 1),
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
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            const MapViewer(),
            Positioned(
              top: 10,
              left: 30,
              right: 30,
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
        ),
      ),
    );
  }
}
