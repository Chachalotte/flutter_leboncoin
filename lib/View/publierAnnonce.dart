import 'package:flutter/material.dart';
import 'package:ipssi_flutter_rendu/Services/librairie.dart';
import 'package:ipssi_flutter_rendu/View/Accueil.dart';
import 'package:ipssi_flutter_rendu/View/publierAnnonce.dart';
import 'package:ipssi_flutter_rendu/View/menu.dart';
import 'package:ipssi_flutter_rendu/View/collection.dart';
import 'package:ipssi_flutter_rendu/Services/FirestoreHelper.dart';
import 'package:ipssi_flutter_rendu/Services/global.dart';
import '../firebase_options.dart';

class publierAnnonce extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return publierState();
  }
}

class publierState extends State<publierAnnonce>{
  @override

  String description = "";
  String title = "";
  String  prix = "";

  Widget build(BuildContext context){
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Accueil(),
      ),
      appBar : AppBar(
        title : const Text("Ajouter une annonce"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.yellow,
      body : Center(
        child: new Column(
          children: [
            TextField(
                decoration : InputDecoration(
                    hintText : "Entrer votre adresse mail",
                    icon : const Icon(Icons.description),
                    border : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onChanged : (String value){
                  setState((){
                    description = value;
                  });
                }
            ),
            TextField(
                decoration : InputDecoration(
                    hintText : "Entrer votre adresse mail",
                    icon : const Icon(Icons.titre),
                    border : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onChanged : (String value){
                  setState((){
                    titre = value;
                  });
                }
            ),
            TextField(
                decoration : InputDecoration(
                    hintText : "Entrer votre adresse mail",
                    icon : const Icon(Icons.prix),
                    border : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onChanged : (String value){
                  setState((){
                    prix = value;
                  });
                }
            ),
            const SizedBox(height : 10),
            ElevatedButton(
                onPressed : (){
                  //fonction pour s'inscrire
              validerPublication();
                },
                child : Text("Valider")
            ),
            const SizedBox(height : 10),
          ],
        ),
      ),
    );
  },

  validerPublication(){
    FirestoreHelper().createUser(title).then((value){

      Navigator.push(context, MaterialPageRoute(
          builder: (context){
            return menu();
          }
      ));

    }).catchError((error){
      //Par exemple une perte de connexion
      print(error);

    });
  }
}