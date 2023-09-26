import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_management_bottomnavigation_design/main.dart';
import 'package:health_management_bottomnavigation_design/service/editseatdata.dart';
import 'package:health_management_bottomnavigation_design/service/hospital.dart';
import 'package:intl/intl.dart';

class ItemModel {
  String imageAsset;

  ItemModel(this.imageAsset);
}

class EditSeatData extends StatefulWidget {
  final String documentId;
  final String currentSeat;

  EditSeatData({
    required this.documentId,
    required this.currentSeat,
  });

  @override
  State<EditSeatData> createState() => _EditSeatDataState();
}

class _EditSeatDataState extends State<EditSeatData> {
  TextEditingController editSeatControll = TextEditingController();

  Future<void> updateData() async {
    // Use the provided document ID to update the specific document
    await FirebaseFirestore.instance
        .collection("ICU Information Update")
        .doc(widget.documentId)
        .update({
      "available_seat": editSeatControll.text.trim(),
      "time": getCurrentTime(),
    });
    editSeatControll.clear();

    // Handle success or navigate back here
    Navigator.pop(context); // Return to previous screen
  }

  @override
  void initState() {
    super.initState();
    // Set the initial value of the TextFormField to the current available seat
    editSeatControll.text = widget.currentSeat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit seat Data"),backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: editSeatControll,
              decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.green),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors
                    .green, // Change this color to your desired border color
                width:
                1.0, // Change this width to your desired border width
              ),
            )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),

              onPressed: () async {
                await updateData();
              },
              child: Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}





