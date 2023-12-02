import 'package:flutter/material.dart';
import 'child.dart';

class HostessScreen extends StatefulWidget {
  @override

  _HostessScreenState createState() => _HostessScreenState();
}

class _HostessScreenState extends State<HostessScreen> {
  List<ChildInformation> childrenList = [
    ChildInformation(
      name: "hamza",
      surname: "konac",
      state: "Home",
      carPlateNumber: "ABC 123",
      parentPhoneNumber: "123-456-7890",
    ),
    ChildInformation(
      name: "ETHEM",
      surname: "MENGAASLAN",
      state: "On Way",
      carPlateNumber: "DEF 456",
      parentPhoneNumber: "987-654-3210",
    ),
    ChildInformation(
      name: "Child 3",
      surname: "Lastname",
      state: "Home",
      carPlateNumber: "GHI 789",
      parentPhoneNumber: "555-123-4567",
    ),
    ChildInformation(
      name: "Child 4",
      surname: "Lastname",
      state: "Absent",
      carPlateNumber: "JKL 012",
      parentPhoneNumber: "111-222-3333",
    ),
    ChildInformation(
      name: "ETHEM",
      surname: "MENGAASLAN",
      state: "On Way",
      carPlateNumber: "DEF 456",
      parentPhoneNumber: "987-654-3210",
    ),
    ChildInformation(
      name: "Child 3",
      surname: "Lastname",
      state: "Home",
      carPlateNumber: "GHI 789",
      parentPhoneNumber: "555-123-4567",
    ),
    ChildInformation(
      name: "Child 4",
      surname: "Lastname",
      state: "Absent",
      carPlateNumber: "JKL 012",
      parentPhoneNumber: "111-222-3333",
    ),
    ChildInformation(
      name: "ETHEM",
      surname: "MENGAASLAN",
      state: "On Way",
      carPlateNumber: "DEF 456",
      parentPhoneNumber: "987-654-3210",
    ),
    ChildInformation(
      name: "Child 3",
      surname: "Lastname",
      state: "Home",
      carPlateNumber: "GHI 789",
      parentPhoneNumber: "555-123-4567",
    ),
    ChildInformation(
      name: "Child 4",
      surname: "Lastname",
      state: "Absent",
      carPlateNumber: "JKL 012",
      parentPhoneNumber: "111-222-3333",
    ),
    ChildInformation(
      name: "Child 1",
      surname: "Lastname",
      state: "Home",
      carPlateNumber: "ABC 123",
      parentPhoneNumber: "123-456-7890",
    ),
    ChildInformation(
      name: "Child 2",
      surname: "Lastname",
      state: "On Way",
      carPlateNumber: "DEF 456",
      parentPhoneNumber: "987-654-3210",
    ),
    ChildInformation(
      name: "Child 3",
      surname: "Lastname",
      state: "Home",
      carPlateNumber: "GHI 789",
      parentPhoneNumber: "555-123-4567",
    ),
    ChildInformation(
      name: "Child 4",
      surname: "Lastname",
      state: "Absent",
      carPlateNumber: "JKL 012",
      parentPhoneNumber: "111-222-3333",
    ),
    ChildInformation(
      name: "Child 5",
      surname: "Lastname",
      state: "On Way",
      carPlateNumber: "MNO 345",
      parentPhoneNumber: "444-555-6666",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double topofbutton = screenSize.height * 0.45;
    double lefofbutton = screenSize.width * 0.1;
    double rightofbutton = screenSize.width * 0.15;
    double widthbutton = screenSize.width * 0.25;
    double heightbutton = screenSize.height * 0.1;
    double betweenbutton = screenSize.width * 0.1;
    return Scaffold(

      appBar: AppBar(

        title: Text("Hostess Screen"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Color(0xDBFFFBFB),
                  Color(0xF1C6B8C6),
                  Color(0xF3D8D6C2),
                  Color(0xFFDBCFC4)
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.0), // Add space between image and list
                      ...childrenList.map((child) {
                        return _buildChildContainer(child);
                      }).toList(),
                      SizedBox(height: 20.0), // Add space between list and button
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {

                },

                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFFF77474),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Color(0x3F000000),
                  elevation: 4,
                ),
                child: Container(
                  width: widthbutton*2,
                  height: heightbutton / 1.5,
                  alignment: Alignment.center,
                  child: Text(
                    'Finish Cruise',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChildContainer(ChildInformation child) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: _getChildColor(child.state),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("${child.name} ${child.surname}"),
              SizedBox(width: 60.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      // Implement logic for details arrow tap
                    },
                    child: Icon(Icons.arrow_drop_down_circle_outlined),
                  ),
                  SizedBox(width: 30.0),
                  InkWell(
                    onTap: () {
                      // Implement logic for phone arrow tap
                    },
                    child: Icon(Icons.phone_in_talk_sharp),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getChildColor(String state) {
    // Set colors based on child state
    switch (state) {
      case "Home":
        return Color(0xFFFFB238);
      case "On Way":
        return Color(0xFF9c59b7);
      case "Absent":
        return Color(0xFFe070b0);
      default:
        return Color(0xFF9c59b7);
    }
  }
}
