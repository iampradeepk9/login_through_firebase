import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase/pages/employee.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState()=> _HomeState();

}

class _HomeState extends State<Home>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Employee()));
      },

      child: Icon(Icons.add),),
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
          "Pradeep",
          style: TextStyle(
            color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold),),
        Text(
          "Sharma",
          style: TextStyle(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.bold),)
      ],),),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}


