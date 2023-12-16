import 'package:flutter/material.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/Controller/Concretes/Parent/ParentController.dart';
import 'package:mobile_dev/Controller/Concretes/School/SchoolController.dart';
import 'package:intl/intl.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              // Background Image
              Positioned(
                left: 0,
                top: 0,
                child: Image.asset(
                  'assets/output_image.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
              ),
          
              // Gradient Background
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0xDBFFFBFB),
                        Color(0xF1C6B8C6),
                        Color(0xF3D8D6C2),
                        Color(0xFFDBCFC4),
                      ],
                      stops: [0.0, 0.2, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
          
              // Content
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Child",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Text color
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Child Name and Surname TextField
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          controller: inputController.nameController,
                          validator: parentController.validateName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Child Name",
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          controller: inputController.surnameController,
                          validator: parentController.validateSurname,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Child Surname",
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Tc id TextField
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
          
                            if (pickedDate != null) {
                              String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate);
                              inputController.birthDateController.text = formattedDate; // Use your date format
                            }
                          },
                          child: AbsorbPointer( // To prevent manual editing
                            child: TextFormField(
                              controller: inputController.birthDateController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Birth Date",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Parent Phone TextField

                    //  SizedBox(height: 16.0),
                      // Shuttle Code TextField
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          controller: inputController.shuttleCodeController,
                          validator: parentController.validateShuttleKey,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Shuttle Code",
                          ),
                        ),
                      ),
                     // SizedBox(height: 16.0),
                      SizedBox(height: 16.0),
                      // Boş DropdownButton
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                      // Elevated Button
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 40.0), // Adjusted the width
                        child: ElevatedButton(
                          onPressed: () async{
                            if(await parentController.addChild(inputController,selectedSchool,_formKey.currentState!)){
                              print("SUCESSS!");
                            }
                            else{
                              print("Error");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF66BB82), // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Button border radius
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Add Child", style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}