import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjetas/app/core/core_presentation/global_states/user_provider.dart';
import 'package:tarjetas/app/features/home/presentation/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: body(context),
      )),
    );
  }

  Widget body(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    if (user.user == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Stack(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
        ),
        const HomePageContent(),
      ],
    );
  }
}
