import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjetas/app/core/core_presentation/global_states/user_provider.dart';
import 'package:tarjetas/app/core/core_presentation/global_widgets/global_widgets.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: Center(
        child: Container(
          width: double.infinity,
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.blue,
          child: TextButton(
            onPressed: () => context.read<UserProvider>().login(context),
            child: const Text(
              'Ingresar',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
