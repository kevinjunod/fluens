import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influencrot_flutter/constants.dart';
import 'package:influencrot_flutter/screens/Auth/login/socialIcons.dart';
import 'package:influencrot_flutter/screens/Auth/login/socialLogin.dart';
import 'package:influencrot_flutter/screens/Auth/register/register.dart';
import 'package:influencrot_flutter/screens/Auth/forgotPassword/forgotPassword.dart';
import 'package:influencrot_flutter/widgets/radioButton.dart';
import 'package:influencrot_flutter/widgets/button.dart';
import 'package:influencrot_flutter/API/services.dart';

class Login extends StatefulWidget {
  Login();
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //*Widgets
  bool _obscureTextPassword = false;
  bool _isRemember = false;
  String _email = "evarbion@gmail.com";
  String _password = "Evarbion123!";
  GlobalKey<FormState> form = new GlobalKey<FormState>();
  Services services = new Services();

  void _rememberMe() {
    setState(
      () {
        _isRemember = !_isRemember;
        print(_isRemember);
      },
    );
  }

  bool validateLogin() {
    final validForm = form.currentState;
    if (validForm.validate()) {
      validForm.save();
      return true;
    } else {
      return false;
    }
  }

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Container(
          width: 100,
          height: 1,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    ScreenUtil.init(
      context,
      designSize: Size(1080, 1920),
      allowFontScaling: true,
    );
    return new Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  "assets/images/ic-login.png",
                  width: width / 3,
                  height: height / 5,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset(
                "assets/images/background-dummy.png",
                width: 375.0,
                height: 215.8,
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 28.0,
                right: 18.0,
                top: 40.0,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/logo-dummy.png",
                        width: 100.0,
                        height: 100.0,
                      ),
                      Text(
                        "Fluens.id",
                        style: TextStyle(
                          fontSize: 27.0,
                          letterSpacing: .7,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: new Container(
                      height: height * .4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          top: 10.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 25.0,
                                letterSpacing: .7,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Form(
                              key: form,
                              child: Column(
                                children: [
                                  new TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: "Email / Username",
                                      hintText: 'Example@123.com',
                                    ),
                                    initialValue: _email,
                                    validator: (val) {
                                      // final pattern = new RegExp(
                                      //     r'([\d\w]{1,}@[\w\d]{1,}\.[\w]{1,})');
                                      // return pattern.hasMatch(val)
                                      return val.isEmpty
                                          ? 'email/username is empty'
                                          : null;
                                    },
                                    onChanged: (valEmail) => {
                                      _email = valEmail,
                                      print(_email),
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  new TextFormField(
                                    keyboardType: TextInputType.text,
                                    obscureText: !_obscureTextPassword,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      hintText: 'Minimum 8 characters',
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureTextPassword
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                        ),
                                        onPressed: () {
                                          setState(
                                            () {
                                              _obscureTextPassword =
                                                  !_obscureTextPassword;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    initialValue: _password,
                                    validator: (val) => val.length < 8
                                        ? 'Password is at least 8 characters'
                                        : null,
                                    onChanged: (val) => {
                                      _password = val,
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ForgotPassword(),
                                    ),
                                  ),
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: colorGreyText,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 13.0,
                          ),
                          GestureDetector(
                            onTap: _rememberMe,
                            child: RadioButton(
                              label: "Remember me",
                              selectedType: _isRemember,
                              select: _rememberMe,
                            ),
                          ),
                        ],
                      ),
                      Button(
                        label: 'SIGN IN',
                        select: () {
                          if (validateLogin()) {
                            services.login(_email, _password);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text(
                        "Social Login",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      horizontalLine()
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialLogin(
                        colors: [Colors.grey],
                        iconData: SocialIcons.facebook,
                        onPressed: () => print("Facebook"),
                      ),
                      SocialLogin(
                        colors: [Colors.grey],
                        iconData: SocialIcons.twitter,
                        onPressed: () => print("Twitter"),
                      ),
                      SocialLogin(
                        colors: [Colors.grey],
                        iconData: SocialIcons.google,
                        onPressed: () => print("Google"),
                      ),
                      SocialLogin(
                        colors: [Colors.grey],
                        iconData: SocialIcons.linkedin,
                        onPressed: () => print("LinkedIn"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 13),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
