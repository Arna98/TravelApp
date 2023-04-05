import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';


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
        //part 1
        Container(
          width: double.infinity,
          height: size.height / 1.8,
          color: Colors.red,
        ),
        //part 2
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(children: [
              //design cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.2), width: 1)),
                    child: SizedBox(
                        width: 87,
                        height: 87,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text("Distance"), Text("13Km")],
                        )),
                  ),Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.2), width: 1)),
                    child: SizedBox(
                        width: 87,
                        height: 87,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text("Temp"), Text("19\u2103")],
                        )),
                  ),Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.2), width: 1)),
                    child: SizedBox(
                        width: 87,
                        height: 87,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text("Rating"), Text("4.8")],
                        )),
                  ),
                ],
              ),
              //design description
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 16, 30, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Description"),
                    SizedBox(height: 8),
                    ExpandableText(
                      "data  datadata data datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata",
                      expandText: "Read More",
                      collapseText: "Show Less",
                      maxLines: 3,
                      )
                  ],
                ),
              )
            ]),
          ),
        )
      ]),
    );
  }
}
