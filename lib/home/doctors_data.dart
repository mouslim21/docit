import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String grad ;
  final String experience ;
  final String wilaya;
  final String location;
  final String photo;

  Doctor({this.name, this.grad, this.experience, this.wilaya, this.location, this.photo,});

}
class Spec{
  final String name1 ;
  final String name2;
  final String logoText ;

  Spec({this.name1, this.name2, this.logoText});


}
class Specialitie{

  final List<Spec> listSpecialitie =
  [
    Spec(name1: "أذن وأنف وحنجرة", name2 :"Darma & Laser" ,logoText: "images/riaa.png",),
    Spec(name1: "نساء وولادة", name2 : "Gynecology",logoText: "images/kbda.png",),
    Spec(name1: "جلدية و ليزر", name2 :"ENT" ,logoText:"images/kbda.png" ,),
    Spec(name1: "أذن وأنف وحنجرة", name2 :"Darma & Laser" ,logoText:"images/heart.png" ,),
    Spec(name1:"نساء وولادة" , name2 :"Gynecology" ,logoText: "images/kbda.png",),
    Spec(name1: "جلدية و ليزر", name2 :"ENT" ,logoText:"images/kbda.png" ,),
    Spec(name1: "أذن وأنف وحنجرة", name2 :"Darma & Laser" ,logoText: "images/heart.png",),
    Spec(name1: "نساء وولادة", name2 : "Gynecology",logoText: "images/scanner.png",),
    Spec(name1: "جلدية و ليزر", name2 :"ENT" ,logoText:"images/scanner.png" ,),
    Spec(name1: "أذن وأنف وحنجرة", name2 :"Darma & Laser" ,logoText:"images/heart.png" ,),
    Spec(name1:"نساء وولادة" , name2 :"Gynecology" ,logoText: "images/eyes.png",),
    Spec(name1: "جلدية و ليزر", name2 :"ENT" ,logoText:"images/scanner.png" ,),
  ];
  final List<List<Doctor>> doctors = [
    //0
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],

 //1
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],
  //2
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],
  //3
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],
  //4
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],

  //5
  [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
  Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
  Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
  Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
  Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],
  //6
  [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
  Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
  Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
  Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
  Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
  Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],
    //0
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],

    //1
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],
    //2
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],
    //3
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],
    //4
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],

    //5
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],
    //6
    [Doctor(name : "Dr.Zakria bouchelaghem", grad :"Consultan dermatologist" , experience:"10 years" ,wilaya :"mascara" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr. Mohamed Nasri", grad :"derma & laser" , experience:"16 years" ,wilaya :"setif" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Hamza Korbaa", grad :"Gynecology" , experience:"36 years" ,wilaya :"alger" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Zakria chergui", grad :"Ent" , experience:"66 years" ,wilaya :"batna" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Mohamed réda aced ", grad :"Pathology" , experience:"12 years" ,wilaya :"annaba" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,),
      Doctor(name : "Dr.Naszer eddine si mohammed", grad :"Dietetics" , experience:"6 years" ,wilaya :"boumerdes" , location :" next the hight school" ,photo :"images/ph9.jpeg" ,), ],

  ];
  List<Doctor> getDoctors (nb){
    return doctors[nb];
  }
  String getName1 (nb){
    return listSpecialitie[nb].name1;
  }
  String getName2(nb){
    return listSpecialitie[nb].name2;
  }
  String getLogoText (nb){
    return listSpecialitie[nb].logoText;
  }
  int getTail(){
    return listSpecialitie.length;
  }
  List<Spec> getList(){
    return listSpecialitie;
  }


}

