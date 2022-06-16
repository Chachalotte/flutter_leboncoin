import 'package:flutter/material.dart';
import 'package:ipssi_flutter_rendu/Services/librairie.dart';
import 'package:ipssi_flutter_rendu/View/Accueil.dart';

class collection extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return collectionState();
  }
}

class collectionState extends State<collection>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Accueil(),
      ),

      appBar : AppBar(
        title : const Text("Listing"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.yellow,
      body : Center(
          child : Text("Que souhaitez-vous faire ?")
      ),
    );
  }
}