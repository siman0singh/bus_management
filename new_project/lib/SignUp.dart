import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/LogIn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final List<String> genderOptions = [
    'male ',
    'female',
 
  ];
  bool _obscureText = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNumberController = TextEditingController();
  // final TextEditingController facultyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();


  // get selectedFaculty => null;

  // Future<void> _authenticate(
  //     {required String apiUrl, required Map<String, String> body}) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       body: {
  //         'email': emailController.text,
  //         'password': passwordController.text,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       // Successful authentication, handle the response accordingly
  //       var data = jsonDecode(response.body.toString());
  //       print(data['token']);
  //       print('Authentication successful');
  //     } else {
  //       // Handle authentication failure
  //       print('Authentication failed');
  //     }
  //   } catch (e) {
  //     // Handle network or other errors
  //     print('Error: $e');
  //   }
  // }

  // void _login() {
  //   final String apiUrl = 'https://reqres.in/api/register';

  //   final Map<String, String> body = {
  //     'email': emailController.text.trim(),
  //     'password': passwordController.text.trim(),
  //   };

  //   _authenticate(apiUrl: apiUrl, body: body);
  // }

  // void _register() {
  //   final String apiUrl = 'https://reqres.in/api/register';
  //
  //   final Map<String, String> body = {
  //     'name': nameController.text.trim(),
  //     'rollNumber': rollNumberController.text.trim(),
  //     'faculty': facultyController.text.trim(),
  //     'email': emailController.text.trim(),
  //     'password': passwordController.text.trim(),
  //   };
  //
  //   _authenticate(apiUrl: apiUrl, body: body);
  // }
  void _register() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = userCredential.user;
      String uid = user?.uid ?? '';
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': nameController.text.trim(),
        'rollNumber': rollNumberController.text.trim(),
        // 'faculty': facultyController.text.trim(),
        'email': emailController.text.trim(),
        'gender': genderController.text.trim(),
        'phoneNumber': phoneController.text.trim(),
        'address': addressController.text.trim(),
      });
      Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage()),
                );
    nameController.clear();

 rollNumberController.clear();
  // facultyController.clear();
   emailController.clear();
   genderController.clear();
   phoneController.clear();
   addressController.clear();

      // Additional logic or navigation can be added here
    } catch (e) {
      // Handle registration errors
      print('Error registering user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios),
        title: const Center(child: Text("Sign Up")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container with rounded corners for Name field
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("please enter your info"),
                ],
              ),
              const SizedBox(
                height: 10,
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
                    labelText: 'Name',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Container with rounded corners for Roll Number field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: rollNumberController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.numbers),
                    labelText: 'Roll Number',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Container with rounded corners for Roll Number field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: genderController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.face),
                    labelText: 'gender',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Container with rounded corners for Roll Number field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.contact_phone),
                    labelText: 'phone number',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
               const SizedBox(height: 8),
              // Container with rounded corners for Roll Number field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    labelText: 'address',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              //const SizedBox(height: 8),
              // Container with rounded corners for Faculty field
              // Container(
              //   margin: const EdgeInsets.all(4),
              //   child: DropdownButtonFormField<String>(
              //     // value: selectedFaculty,
              //     onChanged: (String? newValue) {
              //       setState(() {
              //         // selectedFaculty = newValue!;
              //       });
              //     },
              //     items: facultyOptions.map((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(Icons.subject),
              //       // labelText: 'Faculty',
              //       contentPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //     ),
              //   ),
              // ),

             // const SizedBox(height: 8),

              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0),
              //     color: Colors.grey[200],
              //   ),
              //   child: TextField(
              //     controller: facultyController,
              //     decoration: InputDecoration(
              //       labelText: 'Faculty',
              //       contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 8),
              // Container with rounded corners for Email field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Container with rounded corners for Password field
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
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: _login,
              //   child: Text('Login'),
              // ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
