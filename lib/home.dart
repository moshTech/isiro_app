import 'package:flutter/material.dart';

import 'model/yor_count.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = 'oódo';

  String _result = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(String text) {
    if (text == 'CE') {
      _result = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (text == 'pin' ||
        text == 'ona' ||
        text == 'pelu' ||
        text == 'din') {
      num1 = double.parse(yorFig[result]);
      operand = text;
      _result = '0';
    } else if (text == 'je') {
      num2 = double.parse(yorFig[result]);
      if (operand == 'pelu') _result = (num1 + num2).round().toString();
      if (operand == 'din') _result = (num1 - num2).round().toString();
      if (operand == 'ona') _result = (num1 * num2).round().toString();
      if (operand == 'pin') _result = (num1 / num2).round().toString();

      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _result = text;
    }
    print(_result);

    setState(() {
      (text == 'je') ? result = yorFigRev[_result] : result = _result;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: FlatButton(
        // elevation: .5,
        color: (buttonText == 'pin' ||
                buttonText == 'ona' ||
                buttonText == 'din' ||
                buttonText == 'pelu')
            ? Colors.grey.withOpacity(.05)
            : (buttonText == 'CE') ? Colors.red : Colors.white,
        padding: EdgeInsets.all(24.0),
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ìsirò',
          style: TextStyle(
            fontFamily: 'Pacifico',
            // fontSize: 20.0,
          ),
        ),
        // elevation: 4,
        // backgroundColor: Colors.white,
      ),
      drawer: buildDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 24.0,
              ),
              child: Text(
                result,
                style: TextStyle(
                  fontSize: 64.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('éje'),
                    buildButton('ẹ́jọ'),
                    buildButton('ẹ́sàn'),
                    buildButton('pin'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('ẹ́rin'),
                    buildButton('árùn'),
                    buildButton('ẹ́fà'),
                    buildButton('ona'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('ókàn'),
                    buildButton('éjì'),
                    buildButton('ẹ́ta'),
                    buildButton('din'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('CE'),
                    buildButton('oódo'),
                    buildButton('je'),
                    buildButton('pelu'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildDrawer() {
    var textStyle = TextStyle(
      fontSize: 20,
      fontFamily: 'Pacifico',
    );
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(
              'Ìsirò',
              style: textStyle,
            ),
          ),
          ListTile(
            title: Text(
              'ohùn',
              style: textStyle,
            ),
            trailing: Icon(Icons.mic_none),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              'Àwòrán',
              style: textStyle,
            ),
            trailing: Icon(Icons.add_a_photo),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              'Ònkà yorùbá',
              style: textStyle,
            ),
            trailing: Icon(Icons.add_to_home_screen),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              'Ìrànwó',
              style: textStyle,
            ),
            trailing: Icon(Icons.help),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
