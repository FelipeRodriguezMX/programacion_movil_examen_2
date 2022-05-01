import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjetas/app/core/core_presentation/global_states/user_provider.dart';
import 'package:tarjetas/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:tarjetas/app/features/home/presentation/widgets/widgets.dart';

part './user_profile_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomAppBar(
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.add),
        onPressed: () => _addAccount(context),
      ),
      body: SafeArea(
          child: Container(
        child: body(context),
      )),
    );
  }

  Widget body(BuildContext context) {
    if (context.read<UserProvider>().isEmpty()) {
      return const Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      child: Stack(
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
      ),
    );
  }

  Future<void> _addAccount(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return const FractionallySizedBox(
          heightFactor: 0.70,
          child: AddAccountModal(),
        );
      },
    );
  }
}
