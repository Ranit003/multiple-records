import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:multiple_records/updaterecord.dart';

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
  Future<void> deleteuser(String value) async{
    String url="http://10.0.2.2/MULTI_API/delete.php";
    var request = await http.post(Uri.parse(url),body:{"userid":value});
    print("$value");
    var response= jsonDecode(request.body);
    if(response["success"]=="true"){
      viewdata();
    }
    else{
      print("Some Issue");
    }
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
        return GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Update(
              userdata[index]["Name"],
              userdata[index]["email"],
              userdata[index]["phone1"],
              userdata[index]["phone2"],
              userdata[index]["address1"],
              userdata[index]["address2"],
              userdata[index]["user_id"],
            )));
          },
          child: Card(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    deleteuser(userdata[index]["user_id"]);
                  }, icon: Icon(Icons.delete)),
                ],
              )
            ],
          ),
        ));
          }
      ),
    );
  }
}
