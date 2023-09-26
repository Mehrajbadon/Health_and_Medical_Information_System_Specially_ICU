import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isFabVisible = true;
  List<BloodDataItem> insertedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Donate"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "রক্তদানের মাধ্যমে একজন মানুষের জীবন বাঁচে, এর চেয়ে বড় মানসিক শান্তি আর হতে পারে না। পাশাপাশি রক্তদাতার আরও কিছু উপকারিতার কথা বলেন চিকিৎসকেরা। চলুন জেনে নেই সেটাই-",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          "১) নিয়মিত রক্ত দানে রক্তে কোলেস্টরেল-এর পরিমাণ কমে যায়, ফলে হৃদরোগ ও হার্ট অ্যাটাক-এর ঝুঁকি কমে।",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          "২) নিয়মিত ( ৪ মাস অন্তর অন্তর) রক্তদানে দেহে নতুন লোহিত রক্ত কণিকা তৈরির হার বৃদ্ধি পায়।",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          "৩) অস্থিমজ্জা সক্রিয় থাকে, দেহের রোগ প্রতিরোধ ক্ষমতা বৃদ্ধি পায় এবং দ্রুত রক্তস্বল্পতা পূরণ হয়।",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          "৪) বিনা খরচে শরীরের চেক-আপ হয়ে যায় এবং শরীরে হেপাটাইটিস-বি,সি, জন্ডিস, ম্যালেরিয়া, সিফিলিস এবং এইডস-এর মতো বড় কোন রোগ আছে কি না, সেটি জানা যায়।",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          "৫) রক্তদানের মাধ্যমে যে ক্যালরি খরচ হয়, তার ক্ষয়পূরণ ওজন কমাতে ও রক্তচাপ নিয়ন্ত্রনে সহায়ক।",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "If you want to donate blood, click here =>",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.5,
                        color: Colors.blueGrey,
                        letterSpacing: 0.4),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: FloatingActionButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditSeatData(),
                          ),
                        );

                        if (result is BloodDataItem) {
                          setState(() {
                            isFabVisible = false;
                            insertedData.add(result);
                          });
                        }
                      },
                      child: Icon(
                        Icons.add,
                      ),
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: insertedData.length,
                  itemBuilder: (context, index) {
                    final data = insertedData[index];
                    return SingleChildScrollView(
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        elevation: 4,
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              "Name: ${data.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                  letterSpacing: 1),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  "Blood Group: ${data.bloodGroup}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                      letterSpacing: 1),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  "Number: ${data.number}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                      letterSpacing: 1),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  "Address: ${data.Address}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                      letterSpacing: 1),
                                ),
                              )
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNumberScreen(
                                    documentId: data.documentId,
                                    currentNumber: data.number,
                                    currentAddress: data.Address,
                                  ),
                                ),
                              );

                              if (result == true) {
                                // Implement any logic you need when returning from EditNumberScreen
                              }
                            },
                            child: Icon(Icons.edit),
                          ),
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

class BloodDataItem {
  final String documentId;
  final String name;
  final String bloodGroup;
  final String number;
  final String Address;

  BloodDataItem({
    required this.documentId,
    required this.name,
    required this.bloodGroup,
    required this.number,
    required this.Address,
  });
}

class EditSeatData extends StatefulWidget {
  @override
  _EditSeatDataState createState() => _EditSeatDataState();
}

class _EditSeatDataState extends State<EditSeatData> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit data"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Mohammad",
                labelStyle: TextStyle(color: Colors.green),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors
                        .green, // Change this color to your desired border color
                    width:
                        1.0, // Change this width to your desired border width
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: bloodGroupController,
              decoration: InputDecoration(
                labelText: "Blood Group",
                hintText: "O+",
                labelStyle: TextStyle(color: Colors.green),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors
                        .green, // Change this color to your desired border color
                    width:
                        1.0, // Change this width to your desired border width
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: numberController,
              decoration: InputDecoration(
                labelText: "Number",
                hintText: "018********",
                labelStyle: TextStyle(color: Colors.green),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors
                        .green, // Change this color to your desired border color
                    width:
                        1.0, // Change this width to your desired border width
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Address",
                hintText: "Enter your address",
                labelStyle: TextStyle(color: Colors.green),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors
                        .green, // Change this color to your desired border color
                    width:
                        1.0, // Change this width to your desired border width
                  ),
                ),
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
                final name = nameController.text;
                final bloodGroup = bloodGroupController.text;
                final Address = addressController.text;
                final number = numberController.text;

                if (name.isNotEmpty) {
                  try {
                    final documentId =
                        uuid.v4(); // Generate a unique document ID
                    await FirebaseFirestore.instance
                        .collection("BloodDonate")
                        .doc(documentId)
                        .set({
                      "Name": name,
                      "BloodGroup": bloodGroup,
                      "Address": Address,
                      "Number": number,
                    });

                    nameController.clear();
                    bloodGroupController.clear();
                    addressController.clear();
                    numberController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Data added successfully!'),
                      ),
                    );

                    final insertedData = BloodDataItem(
                      documentId: documentId,
                      name: name,
                      bloodGroup: bloodGroup,
                      Address: Address,
                      number: number,
                    );

                    Navigator.pop(context, insertedData);
                  } catch (e) {
                    print("Error: $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: $e'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Name is required.'),
                    ),
                  );
                }
              },
              child: Text("Add data"),
            )
          ],
        ),
      ),
    );
  }
}

class EditNumberScreen extends StatefulWidget {
  final String documentId;
  final String currentNumber;
  final String currentAddress;

  EditNumberScreen({
    required this.documentId,
    required this.currentNumber,
    required this.currentAddress,
  });

  @override
  _EditNumberScreenState createState() => _EditNumberScreenState();
}

class _EditNumberScreenState extends State<EditNumberScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController AddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    numberController.text = widget.currentNumber;
    AddressController.text = widget.currentAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextFormField(
              controller: numberController,
              decoration: InputDecoration(
                  labelText: "Number",
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors
                          .green, // Change this color to your desired border color
                      width:
                          1.0, // Change this width to your desired border width
                    ),
                  )),
            ),
            TextFormField(
              controller: AddressController,
              decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors
                          .green, // Change this color to your desired border color
                      width:
                          1.0, // Change this width to your desired border width
                    ),
                  )),
            ),
        SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),

              onPressed: () async {
                final number = numberController.text;
                final address = AddressController.text;

                try {
                  await FirebaseFirestore.instance
                      .collection("BloodDonate")
                      .doc(widget.documentId)
                      .update({"Number": number, "Address": address});

                  numberController.clear();
                  AddressController.clear();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(' updated successfully!'),
                    ),
                  );

                  Navigator.pop(context, true);
                } catch (e) {
                  print("Error: $e");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: $e'),
                    ),
                  );
                }
              },
              child: Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}
