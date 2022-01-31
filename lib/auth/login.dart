import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/auth/Registration.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation <double> _animation;
  late TextEditingController _emailController= TextEditingController(text: '');
  late TextEditingController _passwordController= TextEditingController(text: '');
  bool _obsecureText=true;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 20));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear)..addListener(() {
      setState(() {

      });
    })..addStatusListener((animationStatus) {
      if(animationStatus == AnimationStatus.completed){
        _animationController.reset();
        _animationController.forward();

      }

    });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          RegisterPage(),
          CachedNetworkImage(
            imageUrl: "https://cdn.pixabay.com/photo/2017/02/19/15/28/sunset-2080072_960_720.jpg",
            placeholder: (context, url) => Image.asset('images/002.jpg',fit: BoxFit.fill,),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                SizedBox(height: 150,),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Login ",style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  style: TextStyle(color: Colors.deepOrange),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    icon: Icon(Icons.email,color: Color(0xff1B1464),size: 25,),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  obscureText: _obsecureText,
                  validator: (value){
                    if(value!.isEmpty || value.length<8){
                      return 'Please enter valid password';

                    }
                    else{
                      return null;
                    }


                  },
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle:  TextStyle(color: Colors.white),
                    icon: Icon(Icons.remove_red_eye,color: Color(0xff1B1464),size: 25,),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),

                ),
                SizedBox(height: 60,),

                RaisedButton(
                  onPressed: (){},
                  color: Color(0xff1B1464),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  padding: EdgeInsets.only(top: 20,bottom: 20,left: 170,right: 170),
                  child: Text('Sign in',style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(padding: EdgeInsets.only(top: 15,bottom: 15,left: 50,right: 50),
                  child: Row(
                    children: [
                      Expanded(child:  FlatButton(
                        onPressed: (){},
                        color: Colors.white24,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                        child: Text('Forgot Password',style: TextStyle(fontSize: 15,
                            color: Colors.white,decoration: TextDecoration.underline
                        ),),
                        padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(child:  FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                        },
                        color: Colors.white24,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                        child: Text('Need Account',style: TextStyle(fontSize: 15,color: Colors.white,
                            decoration: TextDecoration.underline
                        ),),
                        padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                      ),),
                    ],),),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
