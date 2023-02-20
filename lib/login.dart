import 'package:flutter/material.dart';
import 'package:shared_preference/mydash.dart';
import 'package:shared_preference/utils/user_simple_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

   String firstName = "Welcome";

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  void newWork(){
    buildme();
    execute();
  }

Future execute() async {
  firstName =  firstController.text;
  await UserSimplePreferences.setUsername(firstController.text);
}
/*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstName = UserSimplePreferences.getUsername() ?? '';
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child:  Text(firstName),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child:  Text(""),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: firstController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: lastController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  newWork();
                },
                child: const Text('Login',style: TextStyle(fontSize: 30),),
              ),
            ],
          )),
    );
  }

  void buildme() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
  }
}


