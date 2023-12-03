// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  XFile? selectedImage;
  void initState()
  {
    _controller=CameraController(
      CameraDescription(
        sensorOrientation: 1,
        name:'0',
        lensDirection: CameraLensDirection.back
      ), ResolutionPreset.medium
    );
    super.initState();
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title : Center(child: Text("Data Collector"))
        ),
        drawer: Drawer(child: Icon(Icons.ac_unit)),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
              children: [
                Container(
                  height:60,
                  width:150,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2.0,
                        color: Colors.white,
                        spreadRadius: 0.0,
                        offset: Offset(2.0,2.0),
                      )
                    ]
                  ),
                  child: Center(child: Text("Step Count : 382")),
                ),
            
                SizedBox(
                  width:20,
                ),
                Container(
                  height: 70,
                  width:80,
                  decoration: BoxDecoration(
                    border: Border.all(),
                     boxShadow: [
                      BoxShadow(
                        blurRadius: 2.0,
                        color: Colors.white,
                        spreadRadius: 0.0,
                        offset: Offset(2.0,2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.mic)
                  ),


                GestureDetector(
                  onTap: (){
                   _pickImageFromCamera();
                  },
                  child: Container(
                    height:70,
                    width:80,
                    decoration: BoxDecoration(
                      border: Border.all(),
                       boxShadow: [
                      BoxShadow(
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        color: Colors.white,
                        offset: Offset(2.0,2.0),
                      )
                    ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.camera))),
            
              ],),

              
            ),
            SizedBox(height: 10,),

            Container(
              child: Image(
                image:AssetImage("assets/pic.jpeg") ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.fromLTRB(120, 0, 120, 0),
              child:Container(
                height: 50,
                decoration: BoxDecoration(
                  color:Colors.blue[800],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text("Start")),
              ),
            ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(120, 0, 120, 0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color:Colors.red[800],
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text("Stop")),
                ),
              ),

              Container(
                height: 100,
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Text("Happy",
                      
                      style:TextStyle(
                        color:Colors.red[800],
                      )),
                      Text("Emotion",
                      
                      style: TextStyle(
                        color:Colors.black
                      ),)
                    ],),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Text("Hostel",
                      
                      style:TextStyle(
                        color:Colors.red[800],
                      )),
                      Text("Location",
                      
                      style: TextStyle(
                        color:Colors.black
                      ),)
                    ],),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Text("Pizza",
                      
                      style:TextStyle(
                        color:Colors.red[800],
                      )),
                      Text("Food",
                      
                      style: TextStyle(
                        color:Colors.black
                      ),)
                    ],)
                  ],
                ),
              )
          ],
        ),


        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
            backgroundColor: Colors.white,
            label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.notes),
            backgroundColor: Colors.white,
            label:"Notes",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.lock_clock),
            backgroundColor: Colors.white,
            label:"Clock",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.watch),
            backgroundColor: Colors.white,
            label:"Watch"
            ),
          ],
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.shifting, 
          selectedItemColor: Colors.black,  
          iconSize: 40,  
          elevation: 5  
        ),
    );

    
  }

  Future _pickImageFromCamera() async
  {
    final returnedImage=await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      selectedImage=returnedImage;
    });
  }
}
