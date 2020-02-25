import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _operator = ['+', '-', '*', '/'];
 
  final TextEditingController _aUpper = TextEditingController();
  final TextEditingController _bLower = TextEditingController();
  final TextEditingController _cUpeer = TextEditingController();
  final TextEditingController _dLower = TextEditingController();
  double up1 = 0.0, lw1 = 0.0, up2 = 0.0, lw2 = 0.0, up3 = 0.0, lw3 = 0.0, result = 0.0;
 
  String _currentItemSelected = '+';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/wallP.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(' Calculator'),
          backgroundColor: Colors.teal,
          centerTitle: true,
          
        ),
        body: new Column(
           mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 35, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Numerator",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _aUpper,
                    ),
                  ), 
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(35, 20, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Numerator",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _cUpeer,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(23, 0, 5, 0),
                  child: Text('_____________________'),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: DropdownButton<String>(
                        items: _operator.map((String dropdownStringItem){
                          return DropdownMenuItem<String>(
                            value: dropdownStringItem,
                            child: Text(dropdownStringItem,
                            style: TextStyle(fontSize: 30.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        }).toList(),

                        onChanged: (String newValueSelected){
                          // your code to execute, when a menu item is selected from drop down
                          _onDropDownSelectedItem(newValueSelected);  
                        },
                        value: _currentItemSelected,    //select + operator at start
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                  child: Text('_____________________'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 35, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Denominator",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                            
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _bLower,
                    ),
                  ), 
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(35, 10, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Denominator",
                        contentPadding: EdgeInsets.all(5),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _dLower,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      minWidth: 200.0,
                      height: 50,
                      color: Colors.teal,
                    child: Text("Calculate",
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: _onPressed,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Padding(
                  padding: EdgeInsets.fromLTRB(90, 20, 10, 0),
                  child: Text("$up3",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text("Result =  ___________",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(90, 0, 10, 20),
                  child: Text("$lw3",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
  
  void _onDropDownSelectedItem(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
  
  void _onPressed(){
    setState((){
      up1 = double.parse(_aUpper.text);
      lw1 = double.parse(_bLower.text);
      up2 = double.parse(_cUpeer.text);
      lw2 = double.parse(_dLower.text);
      if (_currentItemSelected == '+'){  
        lw3 = aws(up1, up2);
        up3 = (up1 * lw2) + (lw1 * up2);
        lw3 = lw1 * lw2;
      }
      else if (_currentItemSelected == '-'){
        lw3 = aws(lw1,lw2);
        up3 = (up1 * lw2) - (lw1 * up2);
        lw3 = lw1 * lw2;
      }
      else if (_currentItemSelected == '*'){
        lw3 = aws(lw1, up2);
        up3 = up1 * up2;
        lw3 = lw1 * lw2;
      }
      else if (_currentItemSelected == '/'){
        lw3 = aws(lw1, lw2);
        up3 = up1 * lw2;
        lw3 = lw1 * up2;
      }
      simplestform();
    });
  }
  
  double aws(double a, double b){
    if (a == 0){
      return b;
    }
    else{
      return aws(b % a, a);
    }
  }

  void simplestform(){
    double commonFactor = aws(up3, lw3);
    lw3 = lw3 / commonFactor;
    up3 = up3 / commonFactor;
  }

  
}