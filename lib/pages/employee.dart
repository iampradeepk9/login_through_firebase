import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase/service/database.dart';
import 'package:random_string/random_string.dart';
import 'package:fluttertoast/fluttertoast.dart';



class Employee extends StatefulWidget{
  const Employee({super.key});


  @override
  State<Employee> createState()=> _EmployeeState();

}

class _EmployeeState extends State<Employee>{
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController agecontroller = new TextEditingController();
  TextEditingController locationcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Employee",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold),),
          Text(
            "Form",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 18,
                fontWeight: FontWeight.bold),)
        ],),),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text("Name", style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,
        ),),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10)
                  
            ),
            child: TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
            SizedBox(height: 20,),
            Text("Age", style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,
            ),),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)

              ),
              child: TextField(
                controller: agecontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Location", style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,
            ),),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)

              ),
              child: TextField(
                controller: locationcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () async {

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Center(child: CircularProgressIndicator());
                  },
                );

                String Id= randomAlphaNumeric(10);
                Map<String, dynamic> employeeInfoMap = {
                  "Name": namecontroller.text,
                  "Age": agecontroller.text,
                  "Id": Id,
                  "Location": locationcontroller.text,

                };
                await DatabaseMethods().addEmployeeDetails(employeeInfoMap, Id).then((value) {
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                      msg: "Employee Details has been added successfully...!!!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  namecontroller.clear();
                  agecontroller.clear();
                  locationcontroller.clear();
                });

              }, child: Text("Add", style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),)),
            )
      ],),),
    );
  }
}