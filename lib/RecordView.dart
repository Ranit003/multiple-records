import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class RecordView extends StatefulWidget {

  @override
  State<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  List userdata=[];

  Future<void> viewdata() async{
    String url="http://10.0.2.2/MULTI_API/view.php";
    var res= await http.get(Uri.parse(url));
    setState(() {
      userdata=jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('View'),
        actions: const [],
      ),
      body: ListView.builder(itemCount: userdata.length,
          itemBuilder: (context,index){
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(userdata[index]["Name"]),
                  SizedBox(width: 30,),
                  Text(userdata[index]["email"]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(userdata[index]["phone1"]),
                  SizedBox(width: 30,),
                  Text(userdata[index]["phone2"]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center
                ,
                children: [
                  Text(userdata[index]["address1"]),
                  SizedBox(width: 30,),
                  Text(userdata[index]["address2"]),
                ],
              ),
            ],
          ),
        );
          }
      ),
    );
  }
}
