import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final AppBar? appBar;
  //final Color? appBarColor;
  final Widget childWidget;
  final FloatingActionButton? floatingActionButton;
  const Skeleton({
    super.key,
    required this.childWidget,
    this.appBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: childWidget),
      floatingActionButton: floatingActionButton,
    );
  }
}
