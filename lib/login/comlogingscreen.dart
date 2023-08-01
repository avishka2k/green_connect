import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class comLoginscreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<comLoginscreen> {
  bool isRememberMe = false;
  Widget buildUsername(){
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [



        SizedBox(
          height: 5,


        ),
        Container(

          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color:Color(0xFF5F5B5B),
                  blurRadius: 6,
                  offset: Offset(0,2),
                )
              ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.account_circle_outlined,
                  color: Color(0xFF18A689),
                ),
                hintText: 'Community username',
                hintStyle: TextStyle(
                    color: Color(0xFF5F5B5B)
                )
            ),
          ),
        )
      ],
    );
  }
  Widget buildPassword(){
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [



        SizedBox(
          height: 5,


        ),
        Container(

          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF5F5B5B),
                  blurRadius: 6,
                  offset: Offset(0,2),
                )
              ]
          ),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.key,
                  color: Color(0xFF18A689),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: Color(0xFF5F5B5B)
                )
            ),
          ),
        )
      ],
    );
  }

  Widget buildLoginBtn(){
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () => print('Login pressed'),
            child: Text(
              'Login',
              style: TextStyle(
                color:Colors.white,
                fontSize: 16,
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.all(15),

              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50), // Adjust the value to change the border radius
                ),

              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xFF18A689), // Replace this with your desired color
              ),

            )));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white

                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to Community',
                        style: TextStyle(

                          color: Color(0xFF4F4F4F),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,


                        ),

                      ),
                      SizedBox(
                        height: 200,
                      ),
                      buildUsername(),
                      SizedBox(
                        height: 20,
                      ),
                      buildPassword(),
                      SizedBox(
                        height: 60,
                      ),
                      buildLoginBtn(),

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