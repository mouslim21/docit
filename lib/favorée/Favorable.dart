import 'package:docme/home/profil.dart';
import 'package:flutter/material.dart';
import 'package:docme/databasehelper.dart';


class Favorable extends StatefulWidget {
  @override
  _FavorableState createState() => _FavorableState();
}
class _FavorableState extends State<Favorable> {
  var db = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Favorable Doctors"),backgroundColor: Color(0xff5097a4),centerTitle: true,),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: db.getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var item =  snapshot.data[index] ;
                return Dismissible(
                  onDismissed: (_item){
                    deldoc(item["nom"]);
                  },
                  key: ObjectKey(snapshot.data[index]),
                  child: buildCard(context, item),
                  background: Container(
                    color: Color(0xff5097a4),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  Widget buildCard(BuildContext context, var item) {
    return FutureBuilder(
      future: db.getUser(item['nom']),
      builder: (context , snapshot){
        return GestureDetector(
          onTap: ()   {
            Navigator.push(context, MaterialPageRoute(builder: (context)  {
              return profil(info: item,docEx :snapshot.hasData );
            }));
          }, // go to the doctors profile
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blueGrey.shade50,
            ),
            width: double.infinity,
            height: 140,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
                    border: Border.all(width: 3, color: Color(0xfff29a94)),
                    image: DecorationImage(
                        image: NetworkImage(item["profilimage"]), fit: BoxFit.cover),
                  ),
                ),
                //doctor information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item["nom"],
                        style: TextStyle(
                            color: Color(0xff696b9e),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.school,
                            color: Color(0xfff29a94),
                            size: 22,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(item["grad"],
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xff696b9e),
                                  fontSize: 14,
                                  letterSpacing: .3)),
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
                          Text(item["exper"],
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xff696b9e),
                                  fontSize: 14,
                                  letterSpacing: .3)),
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
                          Text(item["wilaya"],
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xff696b9e),
                                  fontSize: 14,
                                  letterSpacing: .3)),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_location,
                            color: Color(0xfff29a94),
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(item["location"],
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xff696b9e),
                                  fontSize: 14,
                                  letterSpacing: .3)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
void deldoc(String name,)async {
  var db =  DatabaseHelper();
  await db.deleteUser(name);}