import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_management_bottomnavigation_design/service/Blood.dart';
import 'package:health_management_bottomnavigation_design/service/doctor.dart';
import 'package:health_management_bottomnavigation_design/service/icu.dart';
import 'package:health_management_bottomnavigation_design/service/mainpage.dart';
import 'package:health_management_bottomnavigation_design/service/medicine.dart';
import 'package:health_management_bottomnavigation_design/service/sidebar.dart';

class BottomBar extends StatefulWidget {
  int selectedIndex =0;

  BottomBar({required this.selectedIndex});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int currentIndex = 0;

  void onitemtapped(int index){
    setState(() {
      widget.selectedIndex = index;
      currentIndex = widget.selectedIndex;
    });
  }
  @override
  void initState() {
    onitemtapped(widget.selectedIndex);

    super.initState();
  }

  final List<Widget> pages=[
    MainSection(),
    Doctor(),
    ICU(),
    BloodDonarList(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0 ? MainSection() : currentIndex == 1 ? Doctor() : currentIndex == 2 ? ICU():BloodDonarList();
    return Scaffold(
      drawer: Sidebar(),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(

        child: Container(
          height: 60,
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = MainSection();
                          currentIndex = 0;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.home,color: currentIndex == 0 ? Colors.white : Colors.white54,),
                          Text("Home",style: TextStyle(color:  currentIndex == 0 ? Colors.white : Colors.white54,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = Doctor();
                          currentIndex = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.person,color: currentIndex == 1 ? Colors.white : Colors.white54,),
                          Text("Doctor",style: TextStyle(color:  currentIndex == 1 ? Colors.white : Colors.white54,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = ICU();
                          currentIndex = 2;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.local_hospital,color: currentIndex == 2 ? Colors.white : Colors.white54,),
                          Text("ICU",style: TextStyle(color:  currentIndex == 2 ? Colors.white : Colors.white54,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = Medicine();
                          currentIndex = 3;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.bloodtype,color: currentIndex == 3 ? Colors.white : Colors.white54,),
                          Text("Blood List",style: TextStyle(color:  currentIndex == 3 ? Colors.white : Colors.white54,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
