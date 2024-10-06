import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'RecordView.dart';

class Update extends StatefulWidget {
  String Name,Email,Phone1,Phone2,Address1,Address2,user_id;

   Update(this.Name,this.Email,this.Phone1,this.Phone2,this.Address1,this.Address2,this.user_id);

  @override
  State<Update> createState() => _UpdateState(Name,Email,Phone1,Phone2,Address1,Address2,user_id);
}

class _UpdateState extends State<Update> {
  String pName,pEmail,pPhone1,pPhone2,pAddress1,pAddress2,user_id;

  _UpdateState(this.pName,this.pEmail,this.pPhone1,this.pPhone2,this.pAddress1,this.pAddress2,this.user_id);



  TextEditingController Name=new TextEditingController();
  TextEditingController Email=new TextEditingController();
  TextEditingController Phone1=new TextEditingController();
  TextEditingController Phone2=new TextEditingController();
  TextEditingController Address1=new TextEditingController();
  TextEditingController Address2=new TextEditingController();
  Future <void> updatedata() async {
    if(Name.text!=""&&
        Email.text!=""&&
        Phone1.text!=""&&
        Phone2.text!=""&&
        Address1.text!=""&&
        Address2.text!=""){
      String url="http://10.0.2.2/MULTI_API/updatedata.php";
      var req = await http.post(Uri.parse(url),body: {
        "pname":Name.text,
        "pemail":Email.text,
        "pphone1":Phone1.text,
        "pphone2":Phone2.text,
        "paddress1":Address1.text,
        "paddress2":Address2.text,
        "user_id":user_id,
      });
      var response=jsonDecode(req.body);
      if(response["success"]=="true"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RecordView()));
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Name.text=pName;
    Email.text=pEmail;
    Phone1.text=pPhone1;
    Phone2.text=pPhone2;
    Address1.text=pAddress1;
    Address2.text=pAddress2;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Record"),
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
              ElevatedButton(onPressed: updatedata, child:Text('Update')),

            ],
          ),
        ),
      ),
    );
  }
}
