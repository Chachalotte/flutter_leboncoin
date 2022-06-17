import 'package:flutter/material.dart';
import 'package:ipssi_flutter_rendu/Services/librairie.dart';
import 'package:ipssi_flutter_rendu/View/Accueil.dart';
import 'package:ipssi_flutter_rendu/View/publierAnnonce.dart';
import 'package:ipssi_flutter_rendu/View/collection.dart';
import 'package:ipssi_flutter_rendu/Services/FirestoreHelper.dart';
import 'package:ipssi_flutter_rendu/Services/global.dart';
import '../firebase_options.dart';

class menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return menuState();
  }
}

class menuState extends State<menu>{
  @override
  Widget build(BuildContext context){

    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: new Column(
          children: [
            new Container(
              child: Accueil()
              ),
              const SizedBox(height : 10),
              ElevatedButton(
                  onPressed : (){
                    //fonction pour s'inscrire
                    publier();
                  },
                  child : Text("Modifier mon profil")
              )
          ],
        ),

      ),

      appBar : AppBar(
        title : const Text("Listing"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.yellow,
      body : Center(
        child: new Column(
          children: [
            const SizedBox(height : 10),
            ElevatedButton(
                onPressed : (){
                  //fonction pour s'inscrire
                  publier();
                },
                child : Text("Publier une collection")
            ),
            const SizedBox(height : 10),
            ElevatedButton(
                onPressed : (){
                  //fonction pour s'inscrire
                  listeAnnonce();
                },
                child : Text("Liste des annonces")
            )
          ],
        ),
      ),
    );


  }

  publier(){
      Navigator.push(context, MaterialPageRoute(
          builder: (context){
            return publierAnnonce();
          }
      ));
  }

  listeAnnonce(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return collection();
        }
    ));
  }
}