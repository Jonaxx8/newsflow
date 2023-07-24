import 'package:flutter/material.dart';
import 'package:newsflow/widgets/custom_button.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/images/news-192.png',
          fit: BoxFit.contain,
          height: 48,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: const Align( 
              alignment: Alignment.topLeft,
              child: Text(
                " See what's \n happening in the \n world right now.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 90,),
          Container(
            margin: const EdgeInsets.fromLTRB(30,10,30,0),
            child: CustomButton(
              onPressed: (){},
              imgPath: 'assets/images/google.png',             
              text: 'Continue with Google',
              color: Colors.white,
              fontColor: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30,10,30,0),
            child: CustomButton(
              onPressed: (){},
              text: 'Login up with Email',
              imgPath: 'assets/images/email.png',
              color: Colors.white,
              fontColor: Colors.black,
            ),
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              Container(
                margin: const EdgeInsets.only(left: 60),
                width: 80,
                child: const Divider(
                  color: Color.fromARGB(255, 236, 233, 233),
                  thickness: 1.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "or",
                  style: TextStyle(
                    color: Color.fromARGB(255, 230, 226, 226),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 60),
                width: 80,
                child: const Divider(
                  color: Color.fromARGB(255, 236, 233, 233),
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.fromLTRB(30,0,30,0),
            child: CustomButton(
              onPressed: (){},
              text: 'Create Account',
              color: const Color.fromARGB(255, 26, 103, 218),
              fontColor: Colors.white,
            ),
          ),
        ],
    ),
    );
  }
}