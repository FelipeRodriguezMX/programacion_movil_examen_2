import 'package:flutter/material.dart';

class SimplePage extends StatelessWidget {
  const SimplePage({
    Key? key,
    required this.child,
    this.appBar,
  }) : super(key: key);
  final Widget child;
  final AppBar? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
