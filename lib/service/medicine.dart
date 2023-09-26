import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_management_bottomnavigation_design/service/sidebar.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  List<Map<String, dynamic>> _allmedicine = [
    {"medicine": "Influenza (Flu)"},
    {"medicine": "Common Cold"},
    {"medicine": "Dengu"},
    {"medicine": "Diabetic"},
    {"medicine": "Orthopedics"},
    {"medicine": "Ophthalmology"},
    {"medicine": "Psychiatry"},
    {"medicine": "Emergency Medicine"},
    {"medicine": "Surgery"},
    {"medicine": "Obstetrics and Gynecology"},
    {"medicine": "Pulmonology"},
    {"medicine": "ENT (Ear, Nose, and Throat)"},
  ];

  List<Map<String, dynamic>> _foundmedicine = [];
  @override
  void initState() {
    _foundmedicine = _allmedicine;
    super.initState();
  }

  void _runfilter(String enterkeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterkeyword.isEmpty) {
      results = _allmedicine;
    } else {
      results = _allmedicine
          .where((user) => user["medicine"]
              .toLowerCase()
              .contains(enterkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundmedicine = results;
    });
  }

  List image = [
    "asset/napa_500_mg.jpg",
    "asset/music3.jpg",
    "asset/ceevit.jpg",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Medicine"), backgroundColor: Colors.green),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Medicine")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No data found"));
            }

            if (snapshot != null && snapshot.data != null) {
              return Container(
                height: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var name = snapshot.data!.docs[index]["name"];
                      var price = snapshot.data!.docs[index]["price"];
                      var docId = snapshot.data!.docs[index].id;
                      final item = snapshot.data!.docs[index];
                      return Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                              Text("${price}Tk",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blueGrey),)
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
