import 'package:flutter/material.dart';
import 'package:truck/screens/otpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 80.0,
          right: 20,
        ),
        child:
            StatefulBuilder(builder: (BuildContext context, StateSetter state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'LOGIN',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              Text(
                'Login/Create Account',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _phoneNumberController,
                  autofocus: true,
                  onChanged: (text) {
                    validate(state);
                  },
                  decoration: InputDecoration(
                    labelText: "10 digit mobile number",
                    prefix: Container(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "+91",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  autovalidate: true,
                  autocorrect: false,
                  maxLengthEnforced: true,
                  validator: (value) {
                    return !isValid
                        ? 'Please provide a valid 10 digit phone number'
                        : null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: RaisedButton(
                      color: !isValid
                          ? Theme.of(context).primaryColor.withOpacity(0.5)
                          : Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      child: Text(
                        !isValid ? "ENTER PHONE NUMBER" : "CONTINUE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        if (isValid) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                  mobileNumber: _phoneNumberController.text,
                                ),
                              ));
                        } else {
                          validate(state);
                        }
                      },
                      padding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
