import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation <double> _animation;
  late TextEditingController _fullnameController= TextEditingController(text: '');
  late TextEditingController _mobilenumberController= TextEditingController(text: '');
  late TextEditingController _emailController= TextEditingController(text: '');
  late TextEditingController _passwordController= TextEditingController(text: '');
  bool _obsecureText=true;

  final _registerFormKey = GlobalKey<FormState>();



  FocusNode _fullnameFocusNode = FocusNode();
  FocusNode _mobilenumberFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();



  @override
  void dispose() {
    _animationController.dispose();
    _fullnameController.dispose();
    _mobilenumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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

  void _submitFormRegister(){
    final isValid = _registerFormKey.currentState!.validate();
    print(';Invalid $isValid');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [

          CachedNetworkImage(
            imageUrl: "https://cdn.pixabay.com/photo/2014/07/16/05/18/beach-394503_960_720.jpg",
            placeholder: (context, url) => Image.asset('images/003.jpg',fit: BoxFit.fill,),
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
                        text: "Register ",style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold,color: Colors.black),
                      ),


                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(key: _registerFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_fullnameFocusNode),
                        focusNode: _fullnameFocusNode,
                        keyboardType: TextInputType.name,
                        controller: _fullnameController,
                        validator: (value){

                          if(value!.isEmpty){
                            return "plz enter valid name";
                          }else{return null;}

                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Full name',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellowAccent),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),

                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_mobilenumberFocusNode),
                        focusNode: _mobilenumberFocusNode,
                        keyboardType: TextInputType.name,
                        controller: _mobilenumberController,
                        validator: (value){

                          if(value!.isEmpty){
                            return "plz enter valid number";
                          }else{return null;}

                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellowAccent),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),

                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        onEditingComplete: ()=>_submitFormRegister(),
                        focusNode: _emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value){

                          if(value!.isEmpty){
                            return "plz enter valid Email";
                          }else{return null;}

                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellowAccent),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),

                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        obscureText: _obsecureText,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_passwordFocusNode),
                        focusNode: _passwordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        validator: (value){

                          if(value!.isEmpty){
                            return "plz enter valid Password";
                          }else{return null;}

                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellowAccent),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),

                      ),
                      SizedBox(height: 50,),

                    ],
                  ),

                ),
                RaisedButton(
                  onPressed: (){},
                  color: Color(0xff009432),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  padding: EdgeInsets.only(top: 20,bottom: 20,left: 170,right: 170),
                  child: Text('Sign Up',style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(padding: EdgeInsets.only(top: 15,bottom: 15,left: 50,right: 50),
                  child: Row(
                    children: [
                      Expanded(child:   RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account?           ",style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,color: Colors.black),
                            ),
                          ],
                        ),
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(child:  FlatButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        color: Colors.white24,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                        child: Text('Sign in',style: TextStyle(fontSize: 15,color: Colors.black,
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
