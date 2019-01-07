import 'package:flutter/material.dart';
import './widgets/ImagesList.dart';
import 'package:http/http.dart' as http;
import './models/M_image.dart';
import 'dart:convert';

class App extends StatefulWidget{
  @override
  State<App> createState() {
    return AppState();
  }
}



class AppState extends State<App> {
 int _counter = 0;
  

  final List<M_image> m_images = [];

   fetchImages() async {
     _counter++;
      final resposnse = await http.get('https://jsonplaceholder.typicode.com/photos/$_counter');
        if(resposnse.statusCode == 200){
          print(resposnse.body);
           final _imagesList  =  M_image.fromJson(json.decode(resposnse.body));
                setState(() {
                m_images.add(_imagesList);
              });
              
        }else{
              throw Exception('Failed to load images');
    }
  }


  @override
  Widget build(BuildContext _context) {
    return  MaterialApp(
           debugShowCheckedModeBanner: false,
           home: Scaffold(
            body: ImagesList(m_images),
            floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: (){      
              fetchImages();
            },
            child: Icon(
            Icons.arrow_upward, 
            color: Colors.black,
            
            ),
        ),

          appBar: AppBar(
            backgroundColor: Colors.amberAccent,
            title: Text('Awesome Pictures'),
            centerTitle: true,

        ),
      )
    );
  }
}