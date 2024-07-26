import 'package:dronaid_app/screens/emergency_page.dart';
import 'package:dronaid_app/screens/home.dart';
import 'package:flutter/material.dart';
import '../../firebase/auth_methods.dart';
import '../../utils/utils.dart';
import '../login/login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isLoading = false;
  bool obscureText = true;

  void signUp() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      address: addressController.text,
      phone_no: phoneController.text,
      hospital_name: hospitalNameController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (res != 'Success') {
      showSnackBar(res, context);
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmergencyPage()));
    }
  }





  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            Center(
              child: SvgPicture.asset(
                'assets/signup.svg',
                height: size.height * 0.5,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Form(
                    child: Column(
                      children: [
                        _buildTextField(hospitalNameController, "Hospital Name", Icons.local_hospital),
                        _buildTextField(emailController, "Email", Icons.email),
                        _buildTextField(
                          passwordController,
                          "Password",
                          Icons.lock,
                          isPassword: true,
                          obscureText: obscureText,
                          toggleObscureText: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        _buildTextField(addressController, "Address", Icons.location_on),
                        _buildTextField(phoneController, "Phone Number", Icons.phone),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.02),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    signUp();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: isLoading
                    ? CircularProgressIndicator(color: primaryColor)
                    : Text("SIGN UP", style: TextStyle(fontSize: 18, color: primaryColor)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize: Size(size.width * 0.8, 50),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.02),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Center(
                  child: Text(
                    "Already has an account? LOGIN",
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, IconData icon, {bool isPassword = false, bool obscureText = false, Function? toggleObscureText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: kPrimaryColor),
          hintText: hintText,
          hintStyle: TextStyle(color: secondaryColor),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              if (toggleObscureText != null) toggleObscureText();
            },
          )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}