import 'package:flutter/material.dart';
import 'package:tarjetas/app/features/home/home.dart';
import 'package:tarjetas/app/features/initial/initial.dart';
import 'package:tarjetas/app/features/transactions/transactions.dart';

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
      case '/transactions':
        return MaterialPageRoute<dynamic>(
            builder: (context) => TransactionPage(
                  cardNumber: args! as String,
                ));
      case '/user':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const UserSection());

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
