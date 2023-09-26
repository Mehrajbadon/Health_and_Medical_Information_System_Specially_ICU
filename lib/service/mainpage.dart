import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_management_bottomnavigation_design/service/Blood.dart';
import 'package:health_management_bottomnavigation_design/service/doctor.dart';
import 'package:health_management_bottomnavigation_design/service/medicine.dart';
import 'package:health_management_bottomnavigation_design/service/sidebar.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

//Home section
class MainSection extends StatefulWidget {
  const MainSection({
    super.key,
    requi,
  });

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  List docimage = [
    "asset/doctor1.jpg",
    "asset/doctor2.jpg",
    "asset/doctor3.jpg",
    "asset/doctor4.jpg",
    "asset/doctor5.jpg",
  ];
  List docList = [
    "DR NAZNIN FATEMA ELI",
    "DR. UMME TAHERA",
    "DR. SAIFUDDIN MAHMUD",
    "DR. MOHAMMAD REZAUL ",
    "DR. MOHAMMAD MOINUDDIN ",
  ];
  List doctype = [
    "ORTHOPEDICS",
    "SURGERY",
    "GASTROENTEROLOGY",
    "ORTHOPEDICS",
    "CARDIOLOGY",
  ];

  List medicine = [
    "asset/napa_500_mg.jpg",
    "asset/ceevit.jpg",
    "asset/Orostar Plus250 ml.jpg",
    "asset/medeasy_hexisol-hand-rub-250-ml.jpg",
    "asset/medeasy-monas-10.jpg",
  ];
  List medicineList = [
    "napa 500mg",
    "Ceevit 250mg",
    "Orostar Plus250 ml",
    "Hexisol250 ml",
    "Monas 1010 mg",
  ];
  List medPrice = [
    "1.08",
    "1.71",
    "135",
    "117",
    "15",
  ];

  List donar = [
    "Abdul Halim",
    "Mahtab Ibne Halim",
    "Aftab Ibne Halim",
    "Mehraj Ibne Halim",
  ];
  List Blood = [
    "A+",
    "O+",
    "O-",
    "B+",
  ];
  List number = [
    "01849154204",
    "01956976971",
    "01846125306",
    "01881335313",
  ];

  final Firebase = FirebaseFirestore.instance.collection("BloodDonate");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Service"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10,),
              //imageslider
              SizedBox(
                height: 200,
                width: double.infinity,
                child: AnotherCarousel(
                  images: [
                    Image.asset("asset/health.jpg",fit: BoxFit.contain,),
                    Image.asset("asset/health1.jpg",fit: BoxFit.contain,),
                    Image.asset("asset/health2.jpg",fit: BoxFit.contain,),
                  ],
                  dotSize: 6,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.white,
                  dotColor: Colors.blueGrey,
                  dotIncreasedColor: Colors.green,
                ),
              ),

              //doctor list
              Padding(
                padding: EdgeInsets.fromLTRB(17, 10, 17, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Doctor",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,fontSize: 19),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Doctor(),));
                      },
                      child: Row(
                        children: [
                          Text(
                            "See all",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.double_arrow,
                            color: Colors.black26,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: docimage.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Image.asset(
                              docimage[index],
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(docList[index],
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),),
                            ),
                            Text(doctype[index],
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.normal),)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              //medicine list
              Padding(
                padding: EdgeInsets.fromLTRB(17, 10, 17, 05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Medicine",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,fontSize: 19),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Medicine(),));
                      },
                      child: Row(
                        children: [
                          Text(
                            "See all",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.double_arrow,
                            color: Colors.black26,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: medicine.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Image.asset(
                              medicine[index],
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(medicineList[index],
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),),
                            ),
                            Text("Price: ${medPrice[index]}",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.normal),)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              //blood donar
              Padding(
                padding: EdgeInsets.fromLTRB(17, 10, 17, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Blood Donar",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,fontSize: 19),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => BloodDonarList(),));
                      },
                      child: Row(
                        children: [
                          Text(
                            "See all",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.double_arrow,
                            color: Colors.black26,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: donar.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text("Name: ${donar[index]}",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,fontSize: 17),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text("Blood Group: ${Blood[index]}",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.normal),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text("Number: ${number[index]}",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.normal),),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: AnotherCarousel(
                images: [
                  Image.asset("asset/imageslider.jpg"),
                  Image.asset("asset/ceevit.jpg"),
                  Image.asset("asset/napa_500_mg.jpg"),
                ],
                dotSize: 6,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.white,
                dotColor: Colors.blueGrey,
                dotIncreasedColor: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
