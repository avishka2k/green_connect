import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_connect/login/login_community_signup.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Loginscreen> {
  bool isRememberMe = false;
  Widget buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF5F5B5B),
                  blurRadius: 1,
                  offset: Offset(0, 0),
                )
              ]),
          height: 60,
          child: const TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Color(0xFF18A689),
              ),
              hintText: 'Username',
              hintStyle: TextStyle(
                color: Color(0xFF5F5B5B),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF5F5B5B),
                blurRadius: 1,
                offset: Offset(0, 0),
              )
            ],
          ),
          height: 60,
          child: const TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.key,
                color: Color(0xFF18A689),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Color(0xFF5F5B5B),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildRememberCb() {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            value: isRememberMe,
            onChanged: (bool? value) {
              setState(() {
                isRememberMe = value!;
              });
            },
          ),
          const Text(
            'Remember Me',
            style: TextStyle(
              color: Color(0xFF18A689),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the home screen when the "Login" button is pressed
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => home()),
          // );
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(15),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF18A689),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget buildsignUpcomm() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CommLoginscreen()));
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Signup Community',
              style: TextStyle(
                color: Color(0xFF18A689),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          color: Color(0xFF4F4F4F),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      buildUsername(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildPassword(),
                      buildRememberCb(),
                      buildLoginBtn(),
                      buildsignUpcomm()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
