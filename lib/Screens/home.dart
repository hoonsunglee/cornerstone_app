import 'package:flutter/material.dart';
import 'package:cornerstone_app/sheets.dart';
import 'package:cornerstone_app/widgets/navigation_bar_b.dart';
import 'package:gsheets/gsheets.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: _buildAppNavBar(context),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildAppNavBar(BuildContext context) => Row(
    children: <Widget>[
      InkWell(
        child: _buildAppBarButton(context, Icons.arrow_back_ios),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      Spacer(),
      _buildAppBarButton(context, Icons.menu),
    ],
  );

  Container _buildAppBarButton(BuildContext context, IconData icon) =>
      Container(
        width: 40.0,
        height: 40.0,
        child: Icon(icon, color: Colors.blueGrey[200],)
      );
}
