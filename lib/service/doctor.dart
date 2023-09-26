import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_management_bottomnavigation_design/service/editseatdata.dart';
import 'package:health_management_bottomnavigation_design/service/hospital.dart';
import 'package:health_management_bottomnavigation_design/service/sidebar.dart';

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  // List<Map<String, dynamic>> _alldoctor = [
  //   {"doctor": "General Medicine"},
  //   {"doctor": "Pediatrics"},
  //   {"doctor": "Cardiology"},
  //   {"doctor": "Dermatology"},
  //   {"doctor": "Orthopedics"},
  //   {"doctor": "Ophthalmology"},
  //   {"doctor": "Psychiatry"},
  //   {"doctor": "Emergency Medicine"},
  //   {"doctor": "Surgery"},
  //   {"doctor": "Obstetrics and Gynecology"},
  //   {"doctor": "Pulmonology"},
  //   {"doctor": "ENT (Ear, Nose, and Throat)"},
  // ];
  //
  // List<Map<String, dynamic>> _founddoctor = [];
  // @override
  // void initState() {
  //   _founddoctor = _alldoctor;
  //   super.initState();
  // }
  //
  // void _runfilter(String enterkeyword) {
  //   List<Map<String, dynamic>> results = [];
  //   if (enterkeyword.isEmpty) {
  //     results = _alldoctor;
  //   } else {
  //     results = _alldoctor
  //         .where((user) =>
  //             user["doctor"].toLowerCase().contains(enterkeyword.toLowerCase()))
  //         .toList();
  //   }
  //   setState(() {
  //     _founddoctor = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Doctor"), backgroundColor: Colors.green),
      body: Column(
        children: [
          // SizedBox(
          //   height: 15,
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 17),
          //   child: TextField(
          //     onChanged: (value) => _runfilter(value),
          //     decoration: InputDecoration(
          //       labelText: "Search Doctor",
          //       labelStyle: TextStyle(
          //           fontSize: 17,
          //           letterSpacing: 2,
          //           color: Colors.blueGrey,
          //           fontWeight: FontWeight.bold),
          //       suffixIcon: Icon(
          //         Icons.search,
          //         color: Colors.blueGrey,
          //         size: 30,
          //       ),
          //       hintText: "Gynecology",
          //       hintStyle: TextStyle(
          //           letterSpacing: 2, fontSize: 17, color: Colors.blueGrey),
          //       border: OutlineInputBorder(
          //         borderSide: BorderSide(
          //           color: Colors.blueGrey,
          //           width: 1,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Doctor List")
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
                        var name1 = snapshot.data!.docs[index]["name1"];
                        var name2 = snapshot.data!.docs[index]["name2"];
                        var name3 = snapshot.data!.docs[index]["name3"];
                        var name4 = snapshot.data!.docs[index]["name4"];
                        var name5 = snapshot.data!.docs[index]["name5"];
                        var name6 = snapshot.data!.docs[index]["name6"];
                        var department =
                            snapshot.data!.docs[index]["department"];
                        var schedule = snapshot.data!.docs[index]["schedule"];
                        var schedule1 = snapshot.data!.docs[index]["schedule1"];
                        var schedule2 = snapshot.data!.docs[index]["schedule2"];
                        var schedule3 = snapshot.data!.docs[index]["schedule3"];
                        var schedule4 = snapshot.data!.docs[index]["schedule4"];
                        var schedule5 = snapshot.data!.docs[index]["schedule5"];
                        var schedule6 = snapshot.data!.docs[index]["schedule6"];
                        var contact = snapshot.data!.docs[index]["contact"];
                        var contact1 = snapshot.data!.docs[index]["contact1"];
                        var contact2 = snapshot.data!.docs[index]["contact2"];
                        var contact3 = snapshot.data!.docs[index]["contact3"];
                        var contact4 = snapshot.data!.docs[index]["contact4"];
                        var contact5 = snapshot.data!.docs[index]["contact5"];
                        var contact6 = snapshot.data!.docs[index]["contact6"];
                        var hospital = snapshot.data!.docs[index]["hospital"];
                        var hospital1 = snapshot.data!.docs[index]["hospital1"];
                        var hospital2 = snapshot.data!.docs[index]["hospital2"];
                        var hospital3 = snapshot.data!.docs[index]["hospital3"];
                        var hospital4 = snapshot.data!.docs[index]["hospital4"];
                        var hospital5 = snapshot.data!.docs[index]["hospital5"];
                        var hospital6 = snapshot.data!.docs[index]["hospital6"];
                        var docId = snapshot.data!.docs[index].id;
                        final item = snapshot.data!.docs[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(department,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                          letterSpacing: 1.5))
                                ],
                              ),
                              trailing: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DoctorDetailScreen(
                                                  name: item['name'],
                                                  name1: item['name1'],
                                                  name2: item['name2'],
                                                  name3: item['name3'],
                                                  name4: item['name4'],
                                                  name5: item['name5'],
                                                  name6: item['name6'],
                                                  department:
                                                      item['department'],
                                                  contact: item['contact'],
                                                  contact1: item['contact1'],
                                                  contact2: item['contact2'],
                                                  contact3: item['contact3'],
                                                  contact4: item['contact4'],
                                                  contact5: item['contact5'],
                                                  contact6: item['contact6'],
                                                  schedule: item['schedule'],
                                                  schedule1: item['schedule1'],
                                                  schedule2: item['schedule2'],
                                                  schedule3: item['schedule3'],
                                                  schedule4: item['schedule4'],
                                                  schedule5: item['schedule5'],
                                                  schedule6: item['schedule6'],
                                                  hospital: item['hospital'],
                                                  hospital1: item['hospital1'],
                                                  hospital2: item['hospital2'],
                                                  hospital3: item['hospital3'],
                                                  hospital4: item['hospital4'],
                                                  hospital5: item['hospital5'],
                                                  hospital6: item['hospital6'],
                                                )));
                                  },
                                  child: Icon(Icons.send)),
                            ),
                          ),
                        );
                      });
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorDetailScreen extends StatelessWidget {
  final String name;
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  final String name5;
  final String name6;
  final String department;
  final String contact;
  final String contact1;
  final String contact2;
  final String contact3;
  final String contact4;
  final String contact5;
  final String contact6;
  final String schedule;
  final String schedule1;
  final String schedule2;
  final String schedule3;
  final String schedule4;
  final String schedule5;
  final String schedule6;
  final String hospital;
  final String hospital1;
  final String hospital2;
  final String hospital3;
  final String hospital4;
  final String hospital5;
  final String hospital6;

  DoctorDetailScreen({
    required this.name,
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
    required this.name5,
    required this.name6,
    required this.department,
    required this.contact,
    required this.contact1,
    required this.contact2,
    required this.contact3,
    required this.contact4,
    required this.contact5,
    required this.contact6,
    required this.hospital,
    required this.hospital1,
    required this.hospital2,
    required this.hospital3,
    required this.hospital4,
    required this.hospital5,
    required this.hospital6,
    required this.schedule,
    required this.schedule1,
    required this.schedule2,
    required this.schedule3,
    required this.schedule4,
    required this.schedule5,
    required this.schedule6,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 17),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${name}",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.5),
                              ),
                              Text(
                                "Department: ${department}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Contact: ${contact}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Schedule: ${schedule}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Hospital: ${hospital}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${name1}",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.5),
                              ),
                              Text(
                                "Department: ${department}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Contact: ${contact1}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Schedule: ${schedule1}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Hospital: ${hospital1}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${name2}",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.5),
                              ),
                              Text(
                                "Department: ${department}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Contact: ${contact2}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Schedule: ${schedule2}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Hospital: ${hospital2}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${name3}",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.5),
                              ),
                              Text(
                                "Department: ${department}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Contact: ${contact3}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Schedule: ${schedule3}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Hospital: ${hospital3}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${name4}",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.5),
                              ),
                              Text(
                                "Department: ${department}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Contact: ${contact4}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Schedule: ${schedule4}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Hospital: ${hospital4}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${name5}",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.5),
                              ),
                              Text(
                                "Department: ${department}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Contact: ${contact5}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Schedule: ${schedule5}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Hospital: ${hospital5}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${name6}",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.5),
                              ),
                              Text(
                                "Department: ${department}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Contact: ${contact6}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Schedule: ${schedule6}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Hospital: ${hospital6}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
