import 'package:material_ui/material_ui.dart';
import 'package:flutter_scroll_bottom_sheet/flutter_bottom_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Example(),
        ),
      ),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          ScrollBottomSheet.open(
            context,
            ListView.builder(
              padding: .all(20),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Text("Hello, World!");
              },
            ),
          );
        },
        child: Text("Oepn Bottom Sheet"),
      ),
    );
  }
}
