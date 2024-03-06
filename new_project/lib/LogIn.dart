import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/DashBoard.dart';


import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMessage =
      ''; 


  @override
  void initState() {
    super.initState();

  }

  bool _obscureText = true;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  get selectedFaculty => null;

  Future<String?> _authenticateWithFirebase(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: nameController.text.trim(),
              password: passwordController.text.trim());
      User? user = userCredential.user;
      String uid = user?.uid ?? '';
      print('Authentication successful');
      print('User ID: ${userCredential.user?.uid}');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashBoard()),
      );
    } on FirebaseAuthException catch (e) {
      print('Authentication failed: $e');
      setState(() {
        errorMessage = 'Wrong email or password. Please try again';
      });
    }
    return null;
  }



  void _login() async {
    // Perform authentication and obtain the user object
    User? user = (await _authenticateWithFirebase(context)) as User?;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
                 //   mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
            Container(
              decoration: const BoxDecoration(),
              child:const  Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 70,
              
                  backgroundImage: AssetImage('images/school.jpeg'),
                ),
              ),
            ),
        
            const SizedBox(
              height: 30,
            ),
        
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Email',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  border: InputBorder.none,
                ),
              ),
            ),
        
            const SizedBox(height: 8),
        
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.key),
                    labelText: 'Password',
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                        ),
              ),
            ),
            const SizedBox(height: 16),
             
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.check_box),
                Text('Remember Me'),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(child: Text("Forgot Password?")),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 7, 121, 243), // Background color
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const NavigationMenu()),
                  // );
                  _login();
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              const  SizedBox(height: 200,),
                InkWell(
                  child: const Text("Sign Up",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}
