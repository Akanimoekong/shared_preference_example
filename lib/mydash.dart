import 'package:flutter/material.dart';
import 'package:shared_preference/utils/user_simple_preferences.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String name = "Dashboard";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = UserSimplePreferences.getUsername() ?? '';
  }

  void goBack() {
    // Navigator.pop(context,)
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: goBack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              child: Center(child: Text(name),),
            ),

          ],
        ),
      ),
    );
  }
}
