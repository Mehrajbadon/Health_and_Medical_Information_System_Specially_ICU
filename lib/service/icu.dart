import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_management_bottomnavigation_design/service/editseatdata.dart';
import 'package:health_management_bottomnavigation_design/service/hospital.dart';
import 'package:health_management_bottomnavigation_design/service/sidebar.dart';

class ICU extends StatefulWidget {
  const ICU({super.key});

  @override
  State<ICU> createState() => _ICUState();
}

class _ICUState extends State<ICU> {
  // List<Map<String, dynamic>> _allicuHospital = [
  //   {"icuHospital": "Chittagong Medical College Hospital (CMCH)"},
  //   {"icuHospital": "Chittagong General Hospital"},
  //   {"icuHospital": "Square Hospital Chittagong"},
  //   {"icuHospital": "Max Hospital, Chittagong"},
  //   {"icuHospital": "Islami Bank Hospital, Chittagong"},
  //   {"icuHospital": "Popular Diagnostic Centre, Chittagong"},
  //   {"icuHospital": "Agrabad Holy Crescent Hospital"},
  //   {"icuHospital": "Southern Medical College and Hospital"},
  //   {"icuHospital": "CSCR Hospital"},
  //   {"icuHospital": "Chattogram Maa-O-Shishu Hospital"},
  // ];
  //
  // List<Map<String, dynamic>> _foundicuHospital = [];
  // @override
  // void initState() {
  //
  //   _foundicuHospital = _allicuHospital;
  //   super.initState();
  //
  // }
  // void _runfilter(String enterkeyword){
  //   List<Map<String, dynamic>> results = [];
  //   if(enterkeyword.isEmpty){
  //     results = _allicuHospital;
  //   }
  //   else{
  //     results = _allicuHospital
  //         .where((user) => user["icuHospital"].toLowerCase().contains(enterkeyword.toLowerCase())).toList();
  //   }
  //   setState(() {
  //     _foundicuHospital = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("ICU"), backgroundColor: Colors.green),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("ICU Information Update")
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
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var name = snapshot.data!.docs[index]["name"];
                    var seat = snapshot.data!.docs[index]["available_seat"];
                    var time = snapshot.data!.docs[index]["time"];
                    var docId = snapshot.data!.docs[index].id;
                    final item = snapshot.data!.docs[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                      elevation: 3,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "Available seat: ${seat}",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    letterSpacing: 1),
                              ),
                            ),

                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Update time: ${time}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black38,letterSpacing: 1),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
