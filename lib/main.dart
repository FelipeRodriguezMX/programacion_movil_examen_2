import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjetas/app/core/core_presentation/global_states/user_provider.dart';
import 'package:tarjetas/app/core/routes/routes.dart';
import 'package:tarjetas/app/features/transactions/presentation/provider/transaction_provider.dart';
import 'package:tarjetas/injection_containers.dart';

void main() {
  setUpInjectionContainers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        title: 'Tarjetas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
