import 'package:flutter/material.dart';
import 'package:shared_preference/mydash.dart';
import 'package:shared_preference/utils/user_simple_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String firstName = "Welcome";

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void newWork() {
    buildme();
    execute();
  }

  Future execute() async {
    firstName = userNameController.text;

    await UserSimplePreferences.setUsername(userNameController.text);
    await UserSimplePreferences.setEmail(emailController.text);
    await UserSimplePreferences.setPhone(phoneController.text);
    await UserSimplePreferences.setAddress(addressController.text);
    await UserSimplePreferences.setPassword(passwordController.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstName = UserSimplePreferences.getUsername() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Shared Preference"),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/newbackground.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Shared Preferences\n Tutorials",
                    style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold, ),

                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Address',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      newWork();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void buildme() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
    if (userNameController.text.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashBoard()));
    } else {
      var snackBar = SnackBar(
        content: Text('Email not found'),
        backgroundColor: Colors.blueGrey,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      /*     Fluttertoast.showToast(
        msg: "Email not found",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );*/
    }
  }
}
