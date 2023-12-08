// AddChildPage.dart
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/Controller/Concretes/Parent/ParentController.dart';
import 'package:mobile_dev/Controller/Concretes/School/SchoolController.dart';


import 'package:flutter/material.dart';

class AddChildPage extends StatefulWidget {
  @override
  _AddChildPage createState() => _AddChildPage();
}

class _AddChildPage extends State<AddChildPage> {
  // Boş bir dropdown değeri
  String? selectedSchool;
  ParentController parentController=ParentController();
  InputController inputController=InputController();
  SchoolController schoolController=SchoolController();
  List<DropdownMenuItem<String>> dropdownMenuItems = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<String> schoolList = await schoolController.getListFromDB();
    List<DropdownMenuItem<String>> items = schoolList.map((String schoolName) {
      return DropdownMenuItem<String>(
        value: schoolName,
        child: Text(schoolName),
      );
    }).toList();

    // Add 'Select a School' item
    items.insert(0, DropdownMenuItem<String>(
      value: null,
      child: Text("Select a School"),
    ));

    setState(() {
      dropdownMenuItems = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Child",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Child Name",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.surnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Child Surname",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.idNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Tc ID",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.shuttleCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Shuttle Code",
                  ),
                ),
                SizedBox(height: 16.0),
                // Boş DropdownButton
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(),
                ),
                child: DropdownButton<String>(
                  value: selectedSchool,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSchool = newValue;
                    });
                  },
                  items: dropdownMenuItems,
                  style: TextStyle(
                    fontSize: 16.0, // DropdownButton text font size
                    color: Colors.black,
                  ),
                  underline: SizedBox(), // Remove default underline
                ),
              ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async{
                    if(await parentController.addChild(inputController,selectedSchool)){
                      print("SUCESSS!");
                    }
                    else{
                      print("yarrami yersin");
                    }
                  },
                  child: Text("Add Child"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
