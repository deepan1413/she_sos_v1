import 'package:flutter/material.dart';

class MapviewPage extends StatefulWidget {
  const MapviewPage({super.key});

  @override
  State<MapviewPage> createState() => _MapviewPageState();
}

class _MapviewPageState extends State<MapviewPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Map View Page'),
      ),
    );
  }
}