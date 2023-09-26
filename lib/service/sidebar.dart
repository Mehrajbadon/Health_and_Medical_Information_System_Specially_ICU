import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_management_bottomnavigation_design/service/blood_donatte.dart';
import 'package:health_management_bottomnavigation_design/service/bottomBar.dart';
import 'package:health_management_bottomnavigation_design/service/doctor.dart';
import 'package:health_management_bottomnavigation_design/service/editseatdata.dart';
import 'package:health_management_bottomnavigation_design/service/hospital.dart';
import 'package:health_management_bottomnavigation_design/service/icu.dart';
import 'package:health_management_bottomnavigation_design/service/mainpage.dart';
import 'package:health_management_bottomnavigation_design/service/medicine.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Material(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(""),
                accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "https://i.postimg.cc/Hnn5yTs7/hospital.jpg",
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,

                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                  "https://i.postimg.cc/zBXpxZGq/hospital1.jpg"
                  ),
                  fit: BoxFit.cover
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.person,color: Colors.blueGrey,),
              title: Text("Home",style: TextStyle(color: Colors.blueGrey,fontSize:   17,letterSpacing:   1),),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> BottomBar(selectedIndex: 0)));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital,color: Colors.blueGrey),
              title: Text("Doctor",style: TextStyle(color: Colors.blueGrey,fontSize:   17,letterSpacing:   1)),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> BottomBar(selectedIndex: 1)));
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_information_outlined,color: Colors.blueGrey),
              title: Text("ICU",style: TextStyle(color: Colors.blueGrey,fontSize:   17,letterSpacing:   1  )),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> BottomBar(selectedIndex: 2)));
              },

            ),

            ListTile(
              leading: Icon(Icons.bloodtype,color: Colors.blueGrey),
              title: Text("Medicine",style: TextStyle(color: Colors.blueGrey,fontSize:   17,letterSpacing:   1  )),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> Medicine()));
              },

            ),

            ListTile(
              leading: Icon(Icons.bloodtype,color: Colors.blueGrey),
              title: Text("Blood Donar List",style: TextStyle(color: Colors.blueGrey,fontSize:   17,letterSpacing:   1  )),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> BottomBar(selectedIndex: 3)));
              },

            ),

            ListTile(
              leading: Icon(Icons.bloodtype,color: Colors.blueGrey),
              title: Text("Blood Donate",style: TextStyle(color: Colors.blueGrey,fontSize:   17,letterSpacing:   1  )),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> Homepage()));
              },

            ),

            Divider(),
            Divider(),

            ListTile(
              leading: Icon(Icons.add_location,color: Colors.blueGrey,size: 25,),
              title: Text("Hospital",style: TextStyle(color: Colors.blueGrey,fontSize:   17,letterSpacing:   1  )),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> Hospital()));
              },
            ),

          ],
        ),
      ),
    );
  }

  void SelectedItem(BuildContext context, int index) {
    switch(index){
      case 0:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomBar(selectedIndex: 0)));
        break;

      case 1:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomBar(selectedIndex: 1)));
        break;
      case 2:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomBar(selectedIndex: 2)));
        break;
      case 3:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomBar(selectedIndex: 3)));
        break;

      case 4:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Hospital()));
        break;


    }
  }
}
