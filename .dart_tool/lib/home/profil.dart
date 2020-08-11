import 'dart:async';
import 'dart:math';
import 'package:docme/databasehelper.dart';
import 'package:docme/home/map.dart';
import 'package:docme/modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:docme/Splash/extension.dart';
import 'package:photo_view/photo_view.dart';
import 'doctors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';


class profil extends StatefulWidget {
  var db =  DatabaseHelper();
  var info;
  var docEx;
  profil({this.info,this.docEx});
  @override
  _profilState createState() => _profilState(info,docEx:docEx);
}
class _profilState extends State<profil>   with SingleTickerProviderStateMixin {
  AnimationController _controller2;
  Animation _animation;
  Future<bool> readdata()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('addtoreco') ?? false;
  }
  adddata()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('addtoreco',(await readdata()) == true?false:true);
print(await readdata());
  }
  @override
  void initState() {
    super.initState();
    _controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end:pi).animate(_controller2)
      ..addListener(
              (){
            setState(() {
            });
          }
      );
    _controller2.forward();
  }
  bool a;
  Completer<GoogleMapController> _controller = Completer();
  var info;
  var docEx;
  bool  b;
  var _firebaseRef = FirebaseDatabase().reference().child("child/drama & laser/doctors/doc1/reco");

  _profilState(this.info,{this.docEx});
  var db = DatabaseHelper();
  Icon _icon;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:Column(
            children: <Widget>[
              Expanded(
                flex: 20,
                child:Container(
                  color: Colors.grey.shade200,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            GestureDetector(
                              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>image("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQXyie7aEGrtWPaGqy-lvSkT_H0Pfdgo2pphA&usqp=CAU"))),
                              child:Hero(
                                tag: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQXyie7aEGrtWPaGqy-lvSkT_H0Pfdgo2pphA&usqp=CAU",
                                child: Container(
                                  height: MediaQuery.of(context).size.height /4+30 ,
                                  decoration: BoxDecoration(
                                      color:Color(0xff5097a4),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(13),
                                        bottomRight: Radius.circular(13),
                                      ),
                                      image: DecorationImage(
                                        image:AssetImage('images/img.jpg'),
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                              ),),
                            Container(
                              margin: EdgeInsets.all(25),
                              child: IconButton(
                                  icon: Icon(Icons.keyboard_backspace,color:Colors.white,size: 35,),
                                  onPressed: () {
                                    var route = MaterialPageRoute(builder: (context)=>DoctorsList(listdocs: 0,));
                                    Navigator.pop(context,route);
                                  }),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25,left: MediaQuery.of(context).size.width-50),
                              child: IconButton(
                                  icon: FutureBuilder<User> (
                                    future: db.getUser(info["nom"]) ,
                                    builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                                      if (snapshot.hasData) {
                                        a = true;
                                        return Icon(Icons.star, size: 35, color: Colors.yellow.shade700,);
                                      }
                                      else {
                                        a = false;
                                        return Icon(Icons.star_border, size: 35, color: Colors.white,);
                                      }
                                    },
                                  ),
                                  onPressed: () async{
                                    setState(() {
                                      if(a == false) {
                                        Icon(Icons.star, size: 35, color: Colors.yellow.shade700,);
                                        adddoc(
                                          info["nom"],      info["profilimage"],
                                          info["covimage"], info['grad'],
                                          info["exper"],    info['wilaya'],
                                          info['location'], info['timing'],
                                          info['email'],    info['number'],
                                          info['reco']
                                        );
                                      }
                                      else  {
                                        Icon(Icons.star_border, size: 35, color: Colors.white,);
                                        deldoc(info['nom'],
                                        );
                                      }
                                    });
                                  }),
                            ),

//                            FutureBuilder(
//                              future:db.getUser(info['name']),
//                              builder: (context ,snapshoot){
//                                 snapshoot.hasData ?_icon = Icon(Icons.favorite_border,color:Colors.yellow,size: 30 ):
//                                 _icon = Icon(Icons.favorite_border,color:Colors.white,size: 30 );
//                                return GestureDetector(
//                                  onTap: (){
//                                    _controller2.isCompleted
//                                        ? _controller2.reverse():
//                                    _controller2.forward();
//                                    Icon icon;
//                                    if(!snapshoot.hasData){
//                                      adddoc(
//                                        info["name"],
//                                        info["profilimage"],
//                                        info["covimg"],
//                                        info['grad'],
//                                        info["exper"],
//                                        info['wilaya'],
//                                        info['location'],
//                                        info['timing'],
//                                        info['email'],
//                                        info['number'],
//                                      );
//                                      icon = Icon(Icons.favorite,color:Colors.yellow,size: 30);
//                                    }
//                                    else{
//                                      icon = Icon(Icons.favorite_border,color:Colors.white,size: 30 );
//                                      deldoc(info['name']);
//                                    };
//                                    setState(() {
//                                      _icon = icon;
//                                    });
//                                  },
//                         child: Container(
//                            margin: EdgeInsets.only(right: 150,left: 300,top: 20),
//                            child: _icon,
//                            //  onPressed: () {},
//                          ),
////                                  child: Container(
////                                      margin: EdgeInsets.only(top: 30,left: 252),
////                                      child: Text("Favorite",style: TextStyle(fontSize: 18,color: Color(0xff5097a4)),),
////                                      padding:  EdgeInsets.only(left: 20,right: 20,top: 9,bottom: 9),
////                                      decoration: BoxDecoration(
////                                          border: Border.all(color:Colors.white,width: 1 ),
////                                          borderRadius: BorderRadius.circular(40)
////                                      )
////                                  ),
//                                );
//                              },
//                            ),
                            GestureDetector(
                              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>image(info['profilimage']))),
                              child: Hero(
                                tag: info['profilimage'],
                                child: Container(
                                  margin: EdgeInsets.only(top: 140,left: MediaQuery.of(context).size.height/5.5),
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:Colors.blueGrey,
                                      image: DecorationImage(
                                        image: NetworkImage(info['profilimage']),
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(info["nom"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:25,
                                color: Colors.black,
                              ),),
                            Text(info["grad"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff5097a4),
                              ),),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 60,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                right: 12,
                              ),
                              width: 80,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xff5097a4)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/ph11.jpeg"),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                right: 12,
                              ),
                              width: 80,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xff5097a4)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/ph7.jpeg"),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                right: 12,
                              ),
                              width: 80,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xff5097a4)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/ph8.jpeg"),
                                  ),

boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                right: 12,
                              ),
                              width: 80,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xff5097a4)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/ph10.jpeg"),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                right: 12,
                              ),
                              width: 80,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xff5097a4)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/ph12.jpeg"),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.blueGrey.shade200,),
                      ListTile(
                        leading: Icon(Icons.business_center,color: Color(0xff5097a4),),
                        title: Text("Experience"),
                        subtitle: Text("${info["exper"]}"),
                      ),
                      Divider(color: Colors.blueGrey.shade200,),
                      ListTile(
                        leading: Icon(Icons.school,color: Color(0xff5097a4),),
                        title: Text("Graduation"),
                        subtitle: Text(info["grad"]),
                      ),
                      Divider(color: Colors.blueGrey.shade200,),
                      ListTile(
                        leading: Icon(Icons.access_time,color: Color(0xff5097a4),),
                        title: Text("Today timing\n"),
                        subtitle: Text(info['timing']),
                      ),
                      Divider(color: Colors.blueGrey.shade200,),
                      ListTile(
                        leading: Icon(Icons.email,color: Color(0xff5097a4),),
                        title: Text("E-mail"),
                        subtitle: Text(info["email"]),
                      ),
                      Divider(color: Colors.blueGrey.shade200,),
                      StreamBuilder(
                        stream: _firebaseRef.onValue,
                        builder: (context,snap){
                          return  ListTile(
                            title: Text("Recomended by"),
                            leading: Icon(Icons.star,color: Color(0xff5097a4),),
                            subtitle: Text("${snap.data.snapshot.value}"),
                          );
                        },
                      ),
                      Divider(color: Colors.blueGrey.shade200,),
                      ListTile(
                        leading: Icon(Icons.location_on,color: Color(0xff5097a4),),
                        title: Text(info["location"]),
                      ),
                      GestureDetector(
                        onTap: (){
                          Route route = MaterialPageRoute(builder: (context)=>HomePage());
                          Navigator.push(context, route);
                        },
                        child: Container(
                          height: 280,
                          child: buildgooglemap(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    color: Colors.grey.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            right: 22,
                            left: 25,
                          ),
                          color: Color(0xff5097a4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          onPressed: () {},
                          child: Text("Make an appointment", style:TextStyle( fontSize: 18,
                              color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: ()async{
                                 var ref = FirebaseDatabase.instance.reference().child('child/drama & laser/doctors/doc1/reco');
                                await ref.once().then((data) async => {
                                  await ref.set((await readdata())==false?data.value + 1:data.value-1),
                                });
                                adddata();
                                bool a = (await readdata())==true;
                            showDialog(
                              context: context,builder: (BuildContext context){
                            return AlertDialog(
                              content: Text(!a?"Maintenant ce médcin recommandé par vous.":
                              "Maintenant ce médcin n'est pas recommandé par vous.",
                                style: GoogleFonts.asap(fontSize: 20,fontWeight: FontWeight.w400),
                              ),
                              actions: <Widget>[
                                FlatButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("ok",
                                    style: GoogleFonts.hind(fontSize: 20,fontWeight: FontWeight.w600,)
                                ))
                              ],
                            );});},
//                          onTap: ()async{
//
//
//                            print("fffffffffffffff");
//
//                                var ref = FirebaseDatabase.instance.reference().child('child/drama & laser/doctors/doc1/reco');
//                                await ref.once().then((data) async => {
//                                  await ref.set((await readdata())==false?data.value + 1:data.value-1),
//                                });
//                                adddata();
//
//                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withAlpha(150)
                            ),
                            child: Icon(Icons.add, color: Color(0xff5097a4),),
                          )
                              //.ripple((){
                          //}, borderRadius:BorderRadius.circular(10), ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 12,top: 3,bottom: 3,left: 5),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffb8bfce).withAlpha(150)
                          ),
                          child: Icon(Icons.call, color: Colors.green.shade800,),
                        ).ripple((){
                    //      call("tel:"+info["number"]);
                        }, borderRadius:BorderRadius.circular(10), ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        )
    );
  }
  Mycontainer(String image) {
    return  Container(
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
        right: 12,
        left: 12,
      ),
      width: 80,
      height: 20,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              spreadRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(12)
      ),
    );
  }
  Widget buildgooglemap(BuildContext context){
    return GestureDetector(
      onDoubleTap: (){
        Route route = MaterialPageRoute(builder: (context)=>HomePage());
        Navigator.push(context, route);
      },
      child: Container(
        height: MediaQuery.of(context).size.height/2,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(35.904436, 4.898395),zoom: 14),
          mapType: MapType.normal,
          onMapCreated:(GoogleMapController controller){
            Completer<GoogleMapController> _controller = Completer();
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
  void adddoc(String name,String image ,String covimage,
      String grad , String exp ,String wilaya , String location,String timing,String email,String number,int reco
      )async {
    var db =  DatabaseHelper();
    await db.saveUser(new User(name,image,covimage,
        grad,exp,wilaya,location,timing,email,number,reco,
    ));
  }

  void deldoc(String name,)async {
    var db =  DatabaseHelper();
    await db.deleteUser(name);}
  void call(var tel) {
    //launch(tel);
  }
  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
 /* makelist(AsyncSnapshot snapshot) {
    List<Widget> list = [];
    for(int i=0;i< snapshot.data['pg'].length;i++){
      list.add(Mycontainer(snapshot.data['pg'][i]));
    }
    return list;
  }*/
}

class image extends StatefulWidget {
  String photo;
  image(this.photo);
  @override
  _imageState createState() => _imageState(photo);
}

class _imageState extends State<image> {
  _imageState(this.photo);
  String photo;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: photo,
        child: Container(
          height: 400,
          width: double.infinity,
          color: Colors.transparent,
          child: PhotoView(
              imageProvider:AssetImage('images/img.jpg')),
        ));
  }
}

Widget buildgooglemap(BuildContext context){
  return GestureDetector(
    onDoubleTap: (){
      Route route = MaterialPageRoute(builder: (context)=>HomePage());
      Navigator.push(context, route);
    },
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(35.904436, 4.898395),zoom: 14),
        mapType: MapType.normal,
        onMapCreated:(GoogleMapController controller){
          Completer<GoogleMapController> _controller = Completer();
          _controller.complete(controller);
        },
      //  markers: {clinique1,clinique2},
      ),
    ),
  );
}