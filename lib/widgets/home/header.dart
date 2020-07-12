import 'package:flutter/material.dart';

class Header extends StatefulWidget {

  Header({Key key, this.onDownButtonPressed}) : super(key: key);

  Function() onDownButtonPressed;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SelectableText("Sean Chang"),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: RawMaterialButton(
                onPressed: widget.onDownButtonPressed,
                elevation: 10.0,
                fillColor: Colors.white,
                child: Icon(Icons.keyboard_arrow_down),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              ),
            ),
          ),
        )
      ],
    );
  }
}