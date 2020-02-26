import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  final TextEditingController _ccontroller = TextEditingController();
  final TextEditingController _dcontroller = TextEditingController();
  int a = 0,b = 0, c = 0, d = 0, result1 = 0,result2= 0;
  var operation = ['+','-','x','/'];
  var _currentOperation = '+';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('Fraction_calculator',
            style: new TextStyle(fontSize:20.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w300,
            fontFamily: "Merriweather"),),
           ),


          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    
                      Expanded(
                      child:TextField(
                      decoration: InputDecoration(
                      filled: true,
                      fillColor:Colors.grey,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        ),
                      hintText:"numerator",
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _acontroller,
                      ),),
                      Padding(padding: EdgeInsets.fromLTRB(10, 20, 90, 0),),
                  
                      Expanded(
                      child:TextField(
                      decoration: InputDecoration(filled: true,
                      fillColor:Colors.grey,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                       ),
                      hintText:"numerator",
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _ccontroller,
                      ),),
                      Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      ),

                     Container(
                       color: const Color(0xFF756d6d),
                       width:90,
                       height:50,
                       child: Text("$result1"),
                     ),    
              ],
              
              ),




              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("_____________"),
                  Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0)),
                  Container(
                    color: Colors.grey,
                    height: 40,
                    width: 50,
                    child: DropdownButton<String>(  
                    items: operation.map((String dropDownStringItem)
                    {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                        style: new TextStyle(fontSize:20.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Merriweather",
                    ),
                    ),
                    );
                    }
                    ).toList(),
                    onChanged: (String newValueSelected){
                      _onDropDownItemSelected(newValueSelected);
                         },
                      value: _currentOperation,
                              
                        ),
                  ),
                                    
                    Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0)),
                    Text("_____________"),
                    Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),                
                    Text('=',
                    style: new TextStyle(fontSize:30.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Merriweather"),
                    ),
                    Text("   _____________")],
                    ),
                                                
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                    
                        Expanded(
                          child:TextField(
                                          decoration: InputDecoration(
                                                filled: true,
                                                fillColor:Colors.grey,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(25.0),
                                           ),
                                        hintText:"denominator",
                                        ),
                                        keyboardType: TextInputType.numberWithOptions(),
                                        controller: _bcontroller,
                                        ),),
                                         Padding(padding: EdgeInsets.fromLTRB(10, 20, 90, 0),),
                                
                        Expanded(
                          child:TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor:Colors.grey,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(25.0),
                                           ),
                                        hintText:"denominator",
                                        ),
                                        keyboardType: TextInputType.numberWithOptions(),
                                        controller: _dcontroller,
                                        ),),
                                         Padding(padding: EdgeInsets.fromLTRB(10, 20, 20, 0), ),
                        Container(
                                  color: const Color(0xFF756d6d),
                                  width:100,
                                  height:50,
                                  child: Text("$result2"),),
                                            
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                                  SizedBox(
                                          width: 0,
                                          height: 80,),
                                  Padding(padding: EdgeInsets.all(5),
                                  child: RaisedButton(
                                                  color: Colors.redAccent,
                                                  child: Text("Calculate",
                                                  style: new TextStyle(fontSize:20.0,
                                                  color: const Color(0xFF000000),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Merriweather"),),
                                                  onPressed: _onPress,
                                                 ),
                                                 ),
                                  Padding(padding: EdgeInsets.all(5),
                                  child: RaisedButton(
                                                    color: Colors.redAccent,
                                                    child: Text("clear",
                                                    style: new TextStyle(fontSize:20.0,
                                                    color: const Color(0xFF000000),
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Merriweather"),),
                                                    onPressed: _onPress2),
                                                    ),
                                               ],
                                               ),
                                              ],
                                             ), 
                                            )
                                           );
                                           }                            
                               void _onPress() {
                                 setState(() {
                                  a = int.parse(_acontroller.text);
                                  b = int.parse(_bcontroller.text);
                                  c = int.parse(_ccontroller.text);
                                  d = int.parse(_dcontroller.text);
                                  if(_currentOperation =='+'){
                                   result1 = (a*d)+(b*c);
                                   result2 = b*d;
                                  }
                                  else if (_currentOperation == '-'){
                                    result1 = (a*d)-(b*c);
                                    result2 = b*d;
                                  }
                                  else if(_currentOperation == 'x'){
                                    result1 = a*c;
                                    result2 = b*d;
                                  }
                                  else if(_currentOperation == '/'){
                                    result1 = a*d;
                                    result2 = b*c;
                                  }
                                for(int i = 2; i<= 100000; i++){
                                  while(result1 % i == 0 && result2 % i==0){
                                    result1=(result1 /i).round();
                                    result2=(result2 /i).round();
                                 }
                               }          
                                  });
                                  }
                                void _onPress2() {
                                   setState(() {
                                   _acontroller.text = "";
                                   _bcontroller.text = "";
                                   _ccontroller.text = "";
                                   _dcontroller.text = "";
                                  result1 = 0;
                                  result2 = 0;
                                  });
                              }
                              void _onDropDownItemSelected(String newValueSelected) {
                               setState(() {
                               this._currentOperation = newValueSelected;
                              });
                   }
}