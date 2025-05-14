import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home:  homePage(),
    );
  }
}
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List studentsName=[];
  TextEditingController studentAddController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: studentAddController,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black
              ),
              borderRadius: BorderRadius.circular(10)
            )
          ),
        ),
      ),
      body: studentsName.isEmpty ? Center(
          child:
          Text("No Students Registered Yet!!",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
      ):

      ListView.builder(
        itemCount: studentsName.length,
          itemBuilder: (context, index){
            return
            Container(
            padding: EdgeInsets.only(bottom: 10),
            child:ListTile(
              tileColor: Colors.black,
              title: Text("${studentsName[index]}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              trailing: IconButton(onPressed: (){
                studentsName.removeAt(index);
                setState(() {

                });
              },
                  icon: Icon(Icons.delete)),
            )
            );
          }
          ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            studentsName.add(studentAddController.text.toString());
            studentAddController.clear();
            setState(() {

            });
          },
        child: Icon(Icons.add),

      ),
    );
  }
}
