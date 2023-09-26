import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_management_bottomnavigation_design/service/sidebar.dart';

class BloodDonarList extends StatefulWidget {
  const BloodDonarList({super.key});

  @override
  State<BloodDonarList> createState() => _BloodDonarListState();
}

class _BloodDonarListState extends State<BloodDonarList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Blood Donar List"), backgroundColor: Colors.green),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("BloodDonate")
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
                    var Name = snapshot.data!.docs[index]["Name"];
                    var Number = snapshot.data!.docs[index]["Number"];
                    var BloodGroup = snapshot.data!.docs[index]["BloodGroup"];
                    var Address = snapshot.data!.docs[index]["Address"];
                    var docId = snapshot.data!.docs[index].id;
                    final item = snapshot.data!.docs[index];
                    return SingleChildScrollView(
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        elevation: 3,
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Name: $Name",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "Blood Group: ${BloodGroup}",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      letterSpacing: 1),
                                ),
                              ),

                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "Number: ${Number}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.blueGrey,letterSpacing: 1),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "Address: ${Address}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.blueGrey,letterSpacing: 1),
                                ),
                              ),


                            ],
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
