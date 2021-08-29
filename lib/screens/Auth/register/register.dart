import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influencrot_flutter/constants.dart';
import 'package:influencrot_flutter/widgets/radioButton.dart';
import 'package:influencrot_flutter/widgets/button.dart';
import 'package:influencrot_flutter/API/services.dart';

class Register extends StatefulWidget {
  Register();
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _registerEmail;
  int _selectedType;
  bool _isSelectedInfluencer = false;
  bool _isSelectedBrand = false;
  Services services = new Services();

  void _selectInfluencer() {
    setState(
      () {
        _isSelectedInfluencer = true;
        _isSelectedBrand = false;
        _selectedType = 1;
      },
    );
    print(_selectedType);
  }

  void _selectBrand() {
    setState(
      () {
        _isSelectedBrand = true;
        _isSelectedInfluencer = false;
        _selectedType = 2;
      },
    );
    print(_selectedType);
  }

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
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            letterSpacing: .5,
            color: colorWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(
          color: colorWhite,
        ),
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
              padding: EdgeInsets.only(
                left: 28.0,
                right: 18.0,
                top: 70.0,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: new Container(
                      height: height * .3,
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
                          left: 20.0,
                          right: 20.0,
                          top: 0.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Registration Email",
                                hintText: 'example@email.com',
                              ),
                              onChanged: (valRegisterEmail) => {
                                _registerEmail = valRegisterEmail,
                                print(_registerEmail)
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RadioButton(
                                  selectedType: _isSelectedInfluencer,
                                  label: "Influencer",
                                  select: _selectInfluencer,
                                ),
                                RadioButton(
                                  selectedType: _isSelectedBrand,
                                  label: "Brand",
                                  select: _selectBrand,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
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
                      Button(
                        label: 'REGISTER',
                        select: () => services.register(
                          _registerEmail,
                          _selectedType,
                        ),
                      ),
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
