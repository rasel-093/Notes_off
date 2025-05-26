import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes Off"),),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: ( context, index){
        return ListTile(
          title: Text("Note Title"),
          subtitle: Text("Note Description"),
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
          trailing: Icon(Icons.delete),
        );
      },),
    );
  }
}
