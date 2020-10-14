import 'package:flutter/material.dart';
import 'profil.dart';
import 'doctors_data.dart';
import 'home.dart';
import 'package:firebase_database/firebase_database.dart';


class DoctorsList extends StatefulWidget {
  var listdocs;
  var name;
  DoctorsList({Key key, @required this.listdocs,this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DoctorsListState(listdocs : listdocs,name:name);
  }
}

class _DoctorsListState extends State<DoctorsList> {
   var listdocs ;
   var name;
  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.black, fontSize: 18);

  final primary = Colors.blue.shade800;//0xff696b9e
  final secondary = Color(0xfff29a94);

   String specialitieName;
   List<Doctor> data ;
  final TextEditingController _searchDoctor = new TextEditingController();
  String _searchText = "";

  //Monitor the instant change in the search text
  _DoctorsListState({Key key, this.listdocs,this.name}) {

    // specialitieName = Specialitie().getName2(0);
   //  data = Specialitie().getDoctors(0);
    _searchDoctor.addListener(() {
      if (_searchDoctor.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _searchDoctor.text;
        });
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              //build a list of doctors
              Container(
                padding: EdgeInsets.only(top: 145,right: 20,left: 20),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount:listdocs==null?0: listdocs.keys.length,
                    itemBuilder: (BuildContext context, int index) {
                      //In order to filter the list of doctors by search text
                      return _searchText == null || _searchText == ""
                          ? buildCard(context, index,listdocs)
                          : listdocs.values.elementAt(index)["nom"]
                          .toLowerCase()
                          .contains(_searchText.toLowerCase()) ||
                          listdocs.values.elementAt(index)["wilaya"]
                              .toLowerCase()
                              .contains(_searchText.toLowerCase())
                          ? buildCard(context, index,listdocs)
                          : Container(); //buildCard(context, index);
                    }),
              ),
              //build the shape of appBar

              Container(

                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        // go to Specialitie page
                        onPressed: () {
//                          Route route = MaterialPageRoute(
//                              builder: (context) => SpecialitiesList());
                          Navigator.of(context).pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        name,
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                ),
              ),

              //build the decoration of search card
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          controller: _searchDoctor,
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Rechercher ",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, int index,var listdocs) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(builder: (context)=>profil(info : listdocs.values.elementAt(index), docEx : 0 ));
        Navigator.push(context, route);
      }, // go to the doctors profile
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white70,
        ),
        width: double.infinity,
        height: 140,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //photo of doctor
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(right: 10, top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 3, color: secondary),
                image: DecorationImage(
                    image: NetworkImage(listdocs.values.elementAt(index)["profilimage"]), fit: BoxFit.cover),
              ),
            ),
            //doctor information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    listdocs.values.elementAt(index)["nom"],
                    style: TextStyle(
                        color: Color(0xff696b9e),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.school,
                        color: secondary,
                        size: 20,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(listdocs.values.elementAt(index)["grad"],
                          style: TextStyle(
                              color: Color(0xff696b9e), fontSize: 13, letterSpacing: .3)),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Color(0xfff29a94),
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("${listdocs.values.elementAt(index)["exper"]} experience ",
                          style: TextStyle(
                              color: Color(0xff696b9e), fontSize: 13, letterSpacing: .3)),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Color(0xfff29a94),
                        size: 20,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(listdocs.values.elementAt(index)["wilaya"],
                          style: TextStyle(
                              color: Color(0xff696b9e), fontSize: 13, letterSpacing: .3)),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Color(0xfff29a94),
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${listdocs.values.elementAt(index)["number"]} ",
                          style: TextStyle(
                              color: Color(0xff696b9e), fontSize: 13, letterSpacing: .3)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
