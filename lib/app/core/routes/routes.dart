import 'package:flutter/material.dart';
import 'package:tarjetas/app/features/home/home.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const InitialPage());
      case '/home':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const HomePage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ERROR'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Pagina no encontrada'),
          ),
        );
      },
    );
  }
}
