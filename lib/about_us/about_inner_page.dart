import 'package:flutter/material.dart';
import 'about_us.dart';

class Aboutus_Inner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text("About Us",
          style: TextStyle(color: Colors.white,fontSize: 18),
        ),
        leading:  FlatButton(
          onPressed: (){
            Route route = MaterialPageRoute(builder: (context)=>About_us());
            Navigator.pop(context,route);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
        ),
      ),
      body: Container(
        height: 800,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/bg.png"),fit: BoxFit.contain),
          color: Colors.grey.shade200,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 7),
          margin: EdgeInsets.only(top: 00,left: 22,right: 22,bottom: 0),
          height: 400,
          width: 600,
          decoration: BoxDecoration(
            color: Colors.white70.withOpacity(0.9),
          ),
          child: ListView(
            children: <Widget>[
              new Text2(str: "                                        ",),
              SizedBox(height: 12,),
              new Text3(
                str: "Combien cela me coûte-t-il d'utiliser les services Docme?"
                     "Actuellement Docme gratuitement vous ne payez rien de votre côté .\n  \n"),
              SizedBox(height: 14,),
              new Text2(str: "                                        ",),
              SizedBox(height: 12,),
              new Text3(
                  str: "Pourquoi me conseillez-vous d'utiliser cette application ?"

                      "1. Si vous vous réveilliez au milieu de la nuit pour trouver votre petit en train de pleurer?"
                         "Et si vous avez accès à une application mobile ou à un portail en ligne où vous trouverez "
                         "rapidement un pédiatre en activité près de chez vous?"
                      "2. Quel est le moyen le plus rapide et le plus simple de trouver un médecin dans une "
                      "spécialité médicale spécifique sur Internet, en particulier lorsque je suis confronté à une urgence? .\n  \n"),
              SizedBox(height: 14,),
              new Text2(str: "                                        ",),
              SizedBox(height: 12,),
              new Text3(
                  str: "C'est quoi les principales fonctionnalités de Docme ?"

                        "1. Trouver des médecins et revoir leurs détails tels que: spécialité, exposition, expérience, récompenses… etc."
                        "2. Options de recherche interactives pour localiser les rendez-vous médicaux correspondants en fonction des médecins,"
                         "de l'emplacement, de la spécialité ou du domaine médical..\n  \n"),
              SizedBox(height: 14,),
            ],
          ),
        ),
      ),
    );
  }
}

class Text3 extends StatelessWidget {
  Text3({this.str});
  String str;
  @override
  Widget build(BuildContext context) {
    return Text(str,
    textAlign: TextAlign.left,
    style: TextStyle(
      color: Colors.grey,
      fontSize: 16,
    ),);
  }
}

class Text2 extends StatelessWidget {
  String str;
  Text2({this.str});

  @override
  Widget build(BuildContext context) {
    return Text(str,
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.blueGrey,
    fontSize: 24,
    ),
    );
  }
}
