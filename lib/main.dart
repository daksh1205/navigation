import 'package:flutter/material.dart';

void main() {
  runApp(NavApp());
}

class NavApp extends StatefulWidget {
  const NavApp({super.key});

  @override
  State<NavApp> createState() => _NavAppState();
}

class _NavAppState extends State<NavApp> {
  bool isFirstScreen = true;

  setFirstScreen(screenValue) {
    setState(() {
      isFirstScreen = screenValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
          pages: [
            MaterialPage(
              child: FirstScreen(setFirstScreen),
            ),
            if (isFirstScreen == false)
              MaterialPage(child: SecondScreen(setFirstScreen)),
          ],
          onPopPage: (route, result) {
            bool popStatus = route.didPop(result);
            if (popStatus == true) setFirstScreen(true);
            return popStatus;
          }),
    );
  }
}

class FirstScreen extends StatelessWidget {
  final Function setFirstScreen;

  const FirstScreen(this.setFirstScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => setFirstScreen(false),
              child: Text('Go to Screen Two'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final Function setFirstScreen;
  const SecondScreen(this.setFirstScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => setFirstScreen(true),
              child: Text('Return to Screen One'),
            ),
          ],
        ),
      ),
    );
  }
}
