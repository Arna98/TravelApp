import 'package:flutter/material.dart';

void main() {
  runApp(TravelInfo());
}

class TravelInfo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelInfoHome(),
    );
  }
}

class TravelInfoHome extends StatelessWidget {
  const TravelInfoHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Container(
          width: double.infinity,
          height: size.height/1.8,
          color: Colors.red,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.blue,
          ),
        )
      ]),
    );
  }
}
