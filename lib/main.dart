import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/services.dart';
import 'package:travelapp/DataGenerator.dart';
import 'package:travelapp/datamodel/TravelItem.dart';

void main() {
  runApp(TravelInfo());
}

class TravelInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: "poppins",
            fontWeight: FontWeight.w300
          ),
          headlineMedium: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: "poppins",
            fontWeight: FontWeight.w500
          ),
          headlineSmall: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: "poppins",
            fontWeight: FontWeight.w300
          ) ,
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: "poppins",
            fontWeight: FontWeight.w700
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: "poppins",
            fontWeight: FontWeight.w300
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontFamily: "poppins",
            fontWeight: FontWeight.w300
          ),
          displayMedium: TextStyle(
            color: Color.fromARGB(255, 120, 202, 222),
            fontSize: 19,
            fontFamily: "poppins",
            fontWeight: FontWeight.w500
          )
        )
      ),
      home: TravelInfoHome(),
    );
  }
}

class TravelInfoHome extends StatefulWidget {
  const TravelInfoHome({
    super.key,
  });

  @override
  State<TravelInfoHome> createState() => _TravelInfoHomeState();
}

class _TravelInfoHomeState extends State<TravelInfoHome> {
  int _selcetedIndex = 0;
  double? _sizeImage = 55;
  List<TravelItem> _travelItems = DataGenerator.getTravelItems();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            //part 1
            Container(
              width: double.infinity,
              height: size.height / 1.8,
              color: Colors.white,
              child: Stack(
                children: [
                  //image view
                  Container(
                    width: double.infinity,
                    height: 385,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(85),
                            bottomRight: Radius.circular(85)),
                        image: DecorationImage(
                            image: AssetImage(
                                _travelItems[_selcetedIndex].getImage!),
                            fit: BoxFit.fitHeight)),
                  ),
                  //buttons
                  Positioned(
                    top: 24,
                    right: 24,
                    left: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //back button
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 255, 255, 0.5)),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.back,
                                  color: Colors.black)),
                        ),
                        //like buuton
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 255, 255, 0.5)),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.heart,
                                  color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                  //title and location
                  Positioned(
                      left: 30,
                      bottom: 135,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_travelItems[_selcetedIndex].getTitle!,
                              style: Theme.of(context).textTheme.headlineLarge),
                          Row(
                            children: [
                             const  Icon(CupertinoIcons.placemark_fill,
                                  color: Colors.white, size: 11),
                              Text(_travelItems[_selcetedIndex].getLocation!,
                                  style: Theme.of(context).textTheme.bodyMedium)
                            ],
                          )
                        ],
                      )),
                  //listView Items
                  Positioned(
                      right: 0,
                      top: 80,
                      child: SizedBox(
                        width: 90,
                        height: double.maxFinite,
                        child: ListView.builder(
                          itemCount: _travelItems.length,
                          itemBuilder: (context, index) {
                            return imageItem(index);
                          },
                        ),
                      ))
                ],
              ),
            ),
            //part 2
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(children: [
                //design cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /* The container can be used instead of the card as follows:
                    Container(
                      width: 87,
                      height: 87,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color:Color.fromRGBO(0, 0, 0, 0.2)),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Center(child: Text("its a sample")),
                    ), */
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
                            children: [
                              Text("Distance", style: Theme.of(context).textTheme.headlineSmall,),
                              Text(
                                  "${_travelItems[_selcetedIndex].getDistance!.toInt()}km", style: Theme.of(context).textTheme.displayMedium,)
                            ],
                          )),
                    ),
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
                            children: [
                              Text("Temp",style: Theme.of(context).textTheme.headlineSmall,),
                              Text(
                                  "${_travelItems[_selcetedIndex].getTemp!.toInt()}\u2103", style: Theme.of(context).textTheme.displayMedium,)
                            ],
                          )),
                    ),
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
                            children: [
                              Text("Rating", style: Theme.of(context).textTheme.headlineSmall,),
                              Text(
                                  "${_travelItems[_selcetedIndex].getRating}", style: Theme.of(context).textTheme.displayMedium,)
                            ],
                          )),
                    ),
                  ],
                ),
                //design description
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 16, 30, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description", style: Theme.of(context).textTheme.headlineMedium,),
                      const SizedBox(height: 8),
                      ExpandableText(
                        "${_travelItems[_selcetedIndex].getDescription}",
                        expandText: "Read More",
                        collapseText: "Show Less",
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                //design price & button
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Price", style: Theme.of(context).textTheme.headlineMedium),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("\$${_travelItems[_selcetedIndex].getPrice}",style: Theme.of(context).textTheme.bodyLarge,)
                        ],
                      ),
                      //button
                      Container(
                        width: 85,
                        height: 85,
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: IconButton(
                            icon: const Icon(CupertinoIcons.arrow_right),
                            color: Colors.white,
                            onPressed: () {},
                            iconSize: 35),
                      )
                    ],
                  ),
                )
              ]),
            )
          ]),
        ),
      ),
    );
  }

  Widget imageItem(int index) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              _selcetedIndex = index;
            });
          },
          child: AnimatedContainer(
            width: _selcetedIndex == index ? _sizeImage! + 15 : _sizeImage,
            height: _selcetedIndex == index ? _sizeImage! + 15 : _sizeImage,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage(_travelItems[index].getImage!),
                    fit: BoxFit.fill)),
          ),
        ),
      ),
    ]);
  }
}
