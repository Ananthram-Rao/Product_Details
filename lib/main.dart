import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Details',
      theme: ThemeData(fontFamily: 'Montserrat'
       ),
      home: MyHomePage(title: 'Product Details'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState(){
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(color: Colors.blue,
            height: 85.0, width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 30.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0), width: 1.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(child: CarouselWithIndicator()), Expanded(child: BodyLayout()),

     ], ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(width: (MediaQuery.of(context).size.width)*0.47, child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(2.0),
                  side: BorderSide(color: Colors.blue)), highlightColor: Colors.grey,
              color: Colors.white,
              textColor: Colors.blue,
              padding: EdgeInsets.all(8.0),
              onPressed: () {},
              child: Text(
                "Get Likes".toUpperCase(),
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),),
    Container(width: (MediaQuery.of(context).size.width)*0.47, child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(2.0),
                  side: BorderSide(color: Colors.blue)), highlightColor: Colors.orange,
              onPressed: () {},
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              child: Text("Buy now".toUpperCase(),
                  style: TextStyle(fontSize: 24.0)),
            ),),
          ],
        ),
      ),
          );
  }

}
final List<String> imgList = ['https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1564730497.85924830.png?width=420&height=420','https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1564730497.78062445.png?width=420&height=420','https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1564730499.40185132.png?width=420&height=420','https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1564730496.68295540.png?width=420&height=420'];



final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(0, 80, 20, 20), Color.fromARGB(0, 40, 40, 40)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          CarouselSlider(
            items: child,
            autoPlay: true,
            aspectRatio: 2.0,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
          Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(imgList, (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? Color.fromRGBO(0, 0, 40, 0.9) : Color.fromRGBO(0, 0, 40, 0.4)
                    ),
                  );
                }),
              )
          )
        ]
    );
  }
}


class BodyLayout extends StatefulWidget {

  @override
  _BodyLayoutState createState() {
    return _BodyLayoutState();
  }
}
final _productName = 'Mi Power Bank-10000 mAh';
final _productPrice = 2000;
final _productStatus ='Available';
final _numRating = 10;
final _fiveStar = 6;
final _fourStar = 1;
final _threeStar = 1;
final _twoStar = 1;
final _oneStar =1;
final _productRating = (((_fiveStar*5)+(_fourStar*4)+(_threeStar*3)+(_twoStar*2)+(_oneStar*1))/(_numRating));

class _BodyLayoutState extends State<BodyLayout> {

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }

  Widget _myListView(BuildContext context) {
    return ListView(
      children: <Widget>[ ListTile(
        leading: CircleAvatar(backgroundColor: Colors.black
        ),
        title: Text('$_productName', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)), subtitle: Text('This powerbank is powerful in terms of capacity and efficient in terms of charging', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
      ),

    ListTile(
          title: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Row(children: <Widget>[Text('Price: ', style: TextStyle(fontSize: 17)), Text('$_productPrice',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),), Icon(Icons.thumb_up, size: 30, color: Colors.cyan,)],), Row(children: <Widget>[Text('Rated: ', style: TextStyle(fontSize: 17)), Text('$_productRating',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),), Icon(Icons.star, size: 25, color: _productRating < 2 ? Colors.red : _productRating < 4 ? Colors.yellow : Colors.green,), IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () {_sendDataToSecondScreen(context);})],)  ],),
        ),
        ListTile(
          title: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Row(children: <Widget>[Text('Stock: ', style: TextStyle(fontSize: 17)), Text('$_productStatus',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _productStatus == 'Available' ? Colors.green : Colors.red,),)],),new RawMaterialButton(
            onPressed: () {}, highlightColor: Colors.redAccent,
            child: new Icon(
              Icons.add_alert,
              color: Colors.blueAccent,
              size: 35.0,
            ),
            shape: new CircleBorder(),
            elevation: 5.0,
            fillColor: Colors.white70,
            padding: const EdgeInsets.all(10.0),
          ), new RawMaterialButton(
    onPressed: () {},highlightColor: Colors.redAccent, child: new Icon(
    Icons.add_shopping_cart,
    color: Colors.blueAccent,
    size: 35.0,
    ),
    shape: new CircleBorder(),
    elevation: 5.0,
    fillColor: Colors.white70,
    padding: const EdgeInsets.all(10.0),),
    ],),
        ),
        ListTile(
          title: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Row(children: <Widget>[Text('Colors: ', style: TextStyle(fontSize: 17)), new RawMaterialButton(
            onPressed: () {},
            shape: new CircleBorder(),
            fillColor: Colors.black,
            padding: const EdgeInsets.all(10.0),
          ), new RawMaterialButton(
            onPressed: () {},
            shape: new CircleBorder(),
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(10.0),
          ),],),],),
        ),
        ListTile(
          title: Text('Product Highlights:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget> [Text('• 10000 mAh', style: TextStyle(fontSize: 17)), Text('• 18W Fast Charging', style: TextStyle(fontSize: 17)),],), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget> [Text('• Dual USB Output', style: TextStyle(fontSize: 17)), Text('• Two-way quick charge', style: TextStyle(fontSize: 17)),],),],) ,
        ),

      ],
    );
  }
void _sendDataToSecondScreen(BuildContext context) {
  String textToSend1 = _productName;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(text1: textToSend1),
      ));
}
}

class SecondScreen extends StatelessWidget {
  final String text1;

  // receive data from the FirstScreen as a parameter
  SecondScreen({Key key,  @required this.text1,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Reviews')),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Summary',
              style: TextStyle(fontSize: 24),
            ),
          ),Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 60.0, top: 8.0),
                      child: Text(
                            '$_productRating', textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 35,),
                          ),
                    ),
                                   Padding(
                     padding: const EdgeInsetsDirectional.only(top: 8.0),
                     child: Icon(Icons.star, size: 35, color: _productRating < 2 ? Colors.red : _productRating < 4 ? Colors.yellow : Colors.green,),
                   ),],),
                              Padding(
            padding: const EdgeInsetsDirectional.only(start: 53.0),
            child: RichText(
    text: TextSpan(
    text: '$_numRating ', style: TextStyle(fontSize: 20.0, color: Colors.black87),
    children: <TextSpan>[
    TextSpan(text: 'Ratings', style: TextStyle(fontSize: 20.0, color: Colors.black87)),
    ],),),),],
          ),
    Container(color: Colors.black45, height: 130, width: 2,), Padding(
      padding: const EdgeInsetsDirectional.only(end:30.0, bottom:30.0 ),
      child: Column(children: <Widget>[RichText(
                  text: TextSpan(
                    text: '★★★★★: ',
                    style: TextStyle(fontSize: 20.0, color: Colors.orange),
                    children: <TextSpan>[
                      TextSpan(text: '$_fiveStar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black)),
                    ],
                  ),
                ),
                  RichText(
                    text: TextSpan(
                      text: '★★★★☆: ',
                      style: TextStyle(fontSize: 20.0, color: Colors.orange),
                      children: <TextSpan>[
                        TextSpan(text: '$_fourStar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '★★★☆☆: ',
                      style: TextStyle(fontSize: 20.0, color: Colors.orange),
                      children: <TextSpan>[
                        TextSpan(text: '$_threeStar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '★★☆☆☆: ',
                      style: TextStyle(fontSize: 20.0, color: Colors.orange),
                      children: <TextSpan>[
                        TextSpan(text: '$_twoStar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '★☆☆☆☆: ',
                      style: TextStyle(fontSize: 20.0, color: Colors.orange),
                      children: <TextSpan>[
                        TextSpan(text: '$_oneStar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black)),
                      ],
                    ),
                  ),
                ],),
    ) ],), Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
      child: Container(color: Colors.black45, height: 2),
    ),
      ],),
    );
  }
}