import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController Name=new TextEditingController();
  TextEditingController Email=new TextEditingController();
  TextEditingController Password=new TextEditingController();
  TextEditingController Phone1=new TextEditingController();
  TextEditingController Phone2=new TextEditingController();
  TextEditingController Address1=new TextEditingController();
  TextEditingController Address2=new TextEditingController();

  Future<void> insertdata() async{
    if(Name.text!=""&&
        Email.text!=""&&
        Password.text!=""&&
        Phone1.text!=""&&
        Phone2.text!=""&&
        Address1.text!=""&&
        Address2.text!=""){
      String url="http://10.0.2.2/MULTI_API/insertdata.php";
      var req = await http.post(Uri.parse(url),body: {
        "pname":Name.text,
        "pemail":Email.text,
        "ppassword":Password.text,
        "pphone1":Phone1.text,
        "pphone2":Phone2.text,
        "paddress1":Address1.text,
        "paddress2":Address2.text,
      });
      var response=jsonDecode(req.body);
      if(response["success"]=="true"){
            Name.text="";
            Email.text="";
            Password.text="";
            Phone1.text="";
            Phone2.text="";
            Address1.text="";
            Address2.text="";
      }
      else{
        print("Some issue");
      }
    }
    else{
      print("Fill the Record");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child:Column(
            children: [
              TextFormField(
                controller: Name,
                decoration: InputDecoration(label: Text('Name'),
                border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: Email,
                decoration: InputDecoration(label: Text('Email'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: Password,
                decoration: InputDecoration(label: Text('Password'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: Phone1,
                decoration: InputDecoration(label: Text('Phone1'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: Phone2,
                decoration: InputDecoration(label: Text('Phone2'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: Address1,
                decoration: InputDecoration(label: Text('Address1'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: Address2,
                decoration: InputDecoration(label: Text('Address2'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: insertdata, child: Text('Add')),
            ],
          ),
        ),
      ),
    );
  }
}

