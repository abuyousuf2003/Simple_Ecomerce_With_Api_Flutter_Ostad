import 'dart:convert';
import 'dart:math';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage1 extends StatefulWidget
{
  State<HomePage1> createState()=> HomePage1State();
}



class HomePage1State extends State<HomePage1> {
List users=[];
bool isLoading = false;
String x ="jumman";
Future<void> fetchUrl()async{
  setState(() {
    isLoading = true;
  });
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users")) ;

setState(() {
    isLoading = false;
  });
if(response.statusCode == 200)
{
  setState(() {
    users= jsonDecode(response.body);
  });

}
else{
  // setState(() {
  //    x= "sorry bro";
  // });

  throw Exception("sorry");
}
}

@override
  void initState() {
    super.initState();
   fetchUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api User List"),
        
      ),
      body:Column(children: [
// Text(x),



        isLoading?Center(child: CircularProgressIndicator()):
      
       Container(
        child: Expanded(
          child: ListView.builder(
            
            itemCount: users.length,
            itemBuilder: (BuildContext,index){
              final user = users[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text("U",style: TextStyle(color: Colors.white),),
              ),
              title: Text(user['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user['username'],style: TextStyle(color: const Color.fromARGB(255, 31, 30, 30)),),
                 Text(user['address']['street'],style: TextStyle(color: const Color.fromARGB(255, 24, 24, 23)),),
                  Text(user['website'],style: TextStyle(color: const Color.fromARGB(255, 24, 24, 23)),),
                   Text(user['address']['geo']['lat'],style: TextStyle(color: const Color.fromARGB(255, 24, 24, 23)),),
                 
                ],
              ),
            ),
          );
          
          }),
        ),
      ),
      ],)
      
      
      
    );
  }
}