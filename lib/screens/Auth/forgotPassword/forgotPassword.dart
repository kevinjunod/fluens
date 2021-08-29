import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influencrot_flutter/constants.dart';
import 'package:influencrot_flutter/API/services.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword();
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _registeredEmail;
  Services services = new Services();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () => Navigator.of(context).pop(),
    );

    AlertDialog _alertForgotPassword = AlertDialog(
      content: Text(
          "You will recieve a confirmation email for resetting your password"),
      actions: [
        okButton,
      ],
    );

    ScreenUtil.init(context,
        designSize: Size(1080, 1920), allowFontScaling: true);
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(
              letterSpacing: .5,
              color: colorWhite,
              fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: colorWhite),
      ),
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
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
              padding: EdgeInsets.only(left: 28.0, right: 18.0, top: 70.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: new Container(
                      height: height * .15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 0.0, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Enter your registered Email",
                                hintText: 'example@email.com',
                              ),
                              onChanged: (valRegisterEmail) => {
                                _registeredEmail = valRegisterEmail,
                                print(_registeredEmail)
                              },
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: width * .5,
                          height: height * .07,
                          decoration: BoxDecoration(
                            gradient: gradientPrimary,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 10)
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return _alertForgotPassword;
                                },
                              ),
                              child: Center(
                                child: Text(
                                  'SEND',
                                  style: TextStyle(
                                      color: colorWhite,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
