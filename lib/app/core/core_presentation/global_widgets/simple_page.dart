part of './global_widgets.dart';

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
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
