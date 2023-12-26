
// import 'package:casa_example/adminscreen.dart/bottomnav.dart';
// import 'package:casa_example/color.dart';
// import 'package:casa_example/databse/logind.dart';
// import 'package:casa_example/main.dart';
// import 'package:casa_example/signin.dart';
// import 'package:casa_example/userscreen/bottomnav.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:savvy/adminpages/adminhome.dart';
import 'package:savvy/customerpages/signup.dart';
import 'package:savvy/customerpages/user%20database/logindatabase.dart';
import 'package:savvy/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String CorrectUsername = 'admin@gmail.com';
  String CorrectPassword = '1234';

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String enteredUsername = emailController.text;
      String enteredPassword = passwordController.text;
      if (enteredUsername == CorrectUsername &&
          enteredPassword == CorrectPassword) {
        // Authentication successful, set SharedPreferences value
        final _sharedPrefs = await SharedPreferences.getInstance();
        await _sharedPrefs.setBool(Save_key, true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeadimScreen(),));
      } else {
       showDialog(
           context: context,
           builder: (context) {
             return AlertDialog(
               title: const Text('Error'),
               content: Text('Invalid email or password'),
               actions: [
                 TextButton(
                     onPressed: () {
                       Navigator.pop(context);
                     },
                     child: Text('OK'))
               ],
             );
           });
      }
      login(
        emailController.text,
        passwordController.text,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          backgroundColor: Colors.white
          ,
          title: Center(
            child: SizedBox(
          width: 258.0,
           child: TextLiquidFill(
             text: 'Login Your Account',
           waveColor: Color.fromARGB(255, 14, 62, 58),
             boxBackgroundColor: const Color.fromARGB(255, 255, 252, 252),
             textStyle: const TextStyle(
                 fontSize: 30.0,
                fontWeight: FontWeight.bold,
               fontStyle: FontStyle.italic),
             boxHeight: 200.0,
           ),
       ),
    
      ),
          ),
      
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                  ],
                ),
                const SizedBox(height: 5.0),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset('assets/image/undraw_Completed_m9ci.png'),
                        SizedBox(
                          height: 0,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.black12,
                            filled: true,
                            prefixIcon: const Icon(Icons.email),
                            labelText: 'Email Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            fillColor: Colors.black12,
                            filled: true,
                            prefixIcon: const Icon(Icons.key),
                            labelText: 'password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 67, 155, 148),
                                fixedSize: Size(400, 45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an Account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const signin()),
                                );
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(String email, String password, BuildContext context) async {
    final usersBox =
        await Hive.openBox<User>('users'); // Open the Hive box for users

    User? user;

    for (var i = 0; i < usersBox.length; i++) {
      final currentUser = usersBox.getAt(i);

      if (currentUser?.email == email && currentUser?.password == password) {
        user = currentUser;
        break;
      }
    }

    if (user != null) {
      // Login successful, navigate to home page or another screen
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('mails', email);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
     } 
    
  }
}