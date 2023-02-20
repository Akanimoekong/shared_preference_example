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

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(name),),);
  }
}

