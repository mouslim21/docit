import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'about_us.dart';

class FoldingCellSimpleDemo extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey2 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey3 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey4 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey5 = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          " FAQ ",
          style: TextStyle(color: Colors.white),
        ),
        leading: FlatButton(
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => About_us());
            Navigator.pop(context, route);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Color(0xff5097a4),
      ),
      body: ListView(
        children: <Widget>[
          card(context, _foldingCellKey),
          card(context, _foldingCellKey2),
          card(context, _foldingCellKey3),
          card(context, _foldingCellKey4),
          card(context, _foldingCellKey5),
        ],
      ),
    );
  }

  Container card(BuildContext context, _foldingCellKey) {
    return Container(
      color: Colors.grey.shade200,
      alignment: Alignment.topCenter,
      child: SimpleFoldingCell(
          key: _foldingCellKey,
          frontWidget: _buildFrontWidget(_foldingCellKey),
          innerTopWidget: _buildInnerTopWidget(),
          innerBottomWidget: _buildInnerBottomWidget(_foldingCellKey),
          cellSize: Size(MediaQuery.of(context).size.width, 155),
          padding: EdgeInsets.all(15),
          animationDuration: Duration(milliseconds: 150),
          borderRadius: 10,
          onOpen: () => print('cell opened'),
          onClose: () => print('cell closed')),
    );
  }

  Widget _buildFrontWidget(_foldingCellKey) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff5097a4),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12, left: 20, right: 10),
              child: Text(
                  "why would i use your app than using a phone ??,"
                  "do you have sepical offers ??"
                  "and can i book an appointement without crat account ??\n",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600)),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 2,
              ),
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                  size: 30,
                ),
                textColor: Colors.black38,
                color: Color(0xff5097a4),
                splashColor: Colors.white.withOpacity(0.6),
              ),
            )
          ],
        ));
  }

  Widget _buildInnerTopWidget() {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff5097a4),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(top: 12, left: 20, right: 10),
          child: Text(
              "why would i use your app than using a phone ??,"
              "do you have sepical offers ??"
              "and can i book an appointement without crat account ??\n",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600)),
        ));
  }

  Widget _buildInnerBottomWidget(_foldingCellKey) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 4, left: 4),
        child: Column(
          children: <Widget>[
            Text(
              "\nthis app is the one huge medical"
              " directory for many perfessionals ,do"
              "you don'i need to go through the"
              " hassle fo finding clinics details."
              "you don'i need to go through the "
              "hassle fo finding clinics details."
              "\n",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
            ),
            FlatButton(
              onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white),
              ),
              textColor: Colors.white,
              color: Color(0xff5097a4),
//              splashColor: Colors.white.withOpacity(1),
            ),
          ],
        ),
      ),
    );
  }
}
