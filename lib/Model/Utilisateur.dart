
import 'package:cloud_firestore/cloud_firestore.dart';

// Constructeur de la classe utilisateur via Firebase

class Utilisateur {
  //Attributs
  late String id ;
  late String nom;
  late String prenom;
  late String mail;
  String? avatar;
  String? pseudo;
  DateTime birthday =  DateTime.now();





  //Constructeur
  Utilisateur(DocumentSnapshot snapshot){
    String? provisoire;
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map["PRENOM"];
    mail = map["MAIL"];
    provisoire = map["AVATAR"];
    if(provisoire == null){
      // Image
      avatar = "https://firebasestorage.googleapis.com/v0/b/flutter-3d263.appspot.com/o/33b78e66ba000e27d801485c5a9d9697.jpg?alt=media&token=db56b58e-5463-43c2-90bf-60c24f945467";
    }
    else
      {
        avatar = provisoire;
      }
    provisoire = map["PSEUDO"];
    if(provisoire == null){

      pseudo = "";
    }
    else
    {
      pseudo = provisoire;
    }
    Timestamp timestamp = map["BIRTHDAY"];
    birthday = timestamp.toDate();

  }

  //Deuxième constructeur qui affecter les valeurs à vide
Utilisateur.empty(){
    id = "";
    nom ="";
    prenom="";
    mail ="";
    avatar ="";
    pseudo ="";
    birthday = DateTime.now();
}


String nomComplet(){
    return prenom + " " + nom;
}







}