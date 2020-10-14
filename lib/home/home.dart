import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'doctors.dart';
import 'doctors_data.dart';
import 'package:firebase_database/firebase_database.dart';



class SpecialitiesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SpecialitiesListState();
  }

}

class _SpecialitiesListState extends State<SpecialitiesList> {
  final TextStyle dropdownMenuItem = TextStyle(color: Colors.black, fontSize: 18);
  final primary = Colors.blue.shade800;//0xff696b9e
  final secondary = Color(0xfff29a94);
  final bGColor = Color(0xfff0f0f0);
  static  List<String>specialitie =[
    "Ophtalmologue عيون",
    "Pneumologue امراض رئة",
    "Néphrologue كلى ومسالك بولية ",
    "Cardiologue امراض القلب ",
    "Gastroentérologue جهاز هضمي ",
    "Neurologue اعصاب",
    "ONG انف وانذن وحنجرة",
    "Dentiste اسنان ",
    "médecine alternative حجامة و طب بديل",
    "Radiologue اشعة"




  ];



  Widget appBarTitle = Text(
    '   Spécialités',
    style: TextStyle(
      fontStyle: FontStyle.italic, fontSize: 28, fontWeight: FontWeight.w800,),
  );
  Icon actionIcon = new Icon(Icons.search, color: Colors.white,);
  final TextEditingController _searchSpec = new TextEditingController();
  bool _IsSearching;
  String _searchText = "";
  Color searchColor = Colors.red.withOpacity(0.5);
  List<int> listRech = [0,1,2,3,4,5,6,7,8,9];
  var _firebaseRef = FirebaseDatabase().reference().child("child");

  
  //Monitor the instant change in the search text
  _SpecialitiesListState() {

    _searchSpec.addListener(() {
      //for the function of search
      if (_searchSpec.text.isEmpty) {
        setState(() {
          searchColor = Color(0xff696b9e).withOpacity(0.5);
          _IsSearching = false;
          _searchText = "";
          listRech = [0,1,2,3,4,5,6,7,8,9];

        });
      }
      else {
        setState(() {
          searchColor = Colors.white;
          _IsSearching = true;
          _searchText = _searchSpec.text;
          //remplir the list
           listRech = [];
          for (int i=0 ; i<specialitie.length; i++){
            if  (specialitie[i].toLowerCase().contains(_searchText.toLowerCase()))
            {
              listRech.add(i);
            }
          }
        });
      }


    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: CustomScrollView(
          slivers: <Widget>[
            /*ClipPath(
              clipper : WaveClipperTwo(),
            child :buildAppBar() ,),*/
            buildAppBar(),
      StreamBuilder(
        stream: _firebaseRef.onValue ,
        builder:(context , snap){
//           if( true ){
       // print(snap.data.snapshot);
          var data;
          List item = [];
            if(snap.data!=null) {
              data = snap.data.snapshot.value;
              print(data.keys);

            }
              //print(data);
              //List item = [];
              //data.forEach((index, data) => item.add({"key": index, ...data}));
              return SliverPadding(
                padding: EdgeInsets.only(top: 10, left: 16.0, right: 16.0,),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180.0,
                    //the max width of the card

                    mainAxisSpacing: 10.0, //the height between cards
                    crossAxisSpacing: 13.0, //the width between cards
                    childAspectRatio: 1, //heigth of a card
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      // print(snap.data.name);
                      return buildCard(context,data,listRech,index);/* _searchText == null || _searchText == ""?
                           buildCard(context, data,index):
                      (data.keys.elementAt(index).toLowerCase()
                          .contains(_searchText.toLowerCase())||data.values.elementAt(index)['name'].
                      toLowerCase()
                          .contains(_searchText.toLowerCase())?buildCard(context, data,index):Container() );
                    */},
                    childCount:data == null?0: listRech.length,
                  ),
                ),
              )
              ; //};

        }
      )
          ],
        ));
  }

  Widget buildCard(BuildContext context,var snap,List<int> list , int ind) {
    Map spec = {
      "Ophtalmologue": "images/عين.png",
      "Dentiste":"images/اسنان.png",
      "Cardiologue":"images/قلب.png",
      "Pneumologue":"images/رئة.png",
      "ONG":"images/اذن و حنجرة.png",
      "Gastroentérologue":"images/معدة1.png",
      "Néphrologue":"images/كلية.png",
      "médecine alternative":"images/بديل.png",
      "Radiologue": "images/اشعة.png",
      "Neurologue":"images/راس.png"

    };
      int index  = list[ind];
    return GestureDetector(
      onTap:(){

        Route route = MaterialPageRoute(builder: (context)=>DoctorsList(listdocs : snap.values.elementAt(index)["doctors"],
           name: snap.keys.elementAt(index)));
        Navigator.push(context, route);
      },// Go to the page of doctors
      child: Container(
        
        decoration: BoxDecoration(
         
          borderRadius: BorderRadius.circular(25),
          color: Colors.white, //
        ),
                
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 80,
              margin: EdgeInsets.only(left: 4,top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 5, color: Colors.blueGrey[100]), //
                image: DecorationImage(
                  image: AssetImage(
                      spec[snap.keys.elementAt(index)],
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 20,
              child: Text(
                snap.keys.elementAt(index),
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              
            ),
            Container(
              height: 30,
              child: Text(
                snap.values.elementAt(index)['name'],
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              
            ),
          ],
        ),
      ),


    );
  }


  buildAppBar() {
    var top ;
    return
      SliverAppBar(
//      shape: ContinuousRectangleBorder(
//        borderRadius: BorderRadius.only(
//            bottomLeft: Radius.circular(40),
//            bottomRight: Radius.circular(30)),
//      ),
      backgroundColor:Colors.blue.shade800,
      snap: false,
      floating: false,
      pinned: true,
      expandedHeight: 262.0,
      flexibleSpace:LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            top = constraints.biggest.height;
            return FlexibleSpaceBar(
      background:  Stack(
      children: <Widget>[
        Container(height: 240,color: Colors.blue.shade800,),
        Container(height: 80,color: Colors.grey.shade200,
          margin: EdgeInsets.only(top: 220),

        ),
        Container(

          margin: EdgeInsets.only(top: 83),
          child: SizedBox(
              height: 272.0,
              width: 370.0,
              child: CarouselSlider(
                options: CarouselOptions(autoPlay: true,enlargeCenterPage: true,),
                items: ["images/bg.jpg","images/bg3.jpg","images/bg4.jpg",].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          width: MediaQuery.of(context).size.width,
                          //margin: EdgeInsets.symmetric(horizontal: 5.0,),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Image(image: AssetImage(i),fit: BoxFit.fill,)
                      );
                    },
                  );
                }).toList(),
              )
          ),),
        ],
      ),);}
            ),


      title: appBarTitle,

      actions: <Widget>[
        //do the animation when you clique at the search Icon ,The search window appears
        new IconButton(icon: actionIcon,padding: EdgeInsets.only(right: 30), onPressed: () {
          setState(() {
            if (this.actionIcon.icon == Icons.search) {
              this.actionIcon = new Icon(Icons.close, color: Colors.white,);
              this.appBarTitle = new  Padding(
                padding: EdgeInsets.only(right: 0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.all(Radius.circular(30)) ,
                  child: TextField(
                    controller: _searchSpec ,
                    autofocus: true,
                    cursorColor: Theme.of(context).primaryColor,
                    style: dropdownMenuItem,
                    decoration: InputDecoration(
                        hintText: "Rechercher les spécialités",
                        hintStyle: TextStyle(
                            color: Colors.black38, fontSize: 16),
                        prefixIcon: Material(
                          elevation: 0.0,
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(Icons.search, ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 25, vertical: 13)),
                  ),
                ),
              );

              _handleSearchStart();
            }
            else {
              _handleSearchEnd();
            }
          });
        },),
      ],
    );

  }


  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(Icons.search, color: Colors.white,);
      this.appBarTitle = Text(
        '   Spécialités',
        style: TextStyle(
          fontStyle: FontStyle.italic, fontSize: 28, fontWeight: FontWeight.w800,),
      );
      _IsSearching = false;
      _searchSpec.clear();
    });
  }





}






