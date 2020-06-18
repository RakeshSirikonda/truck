import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:truck/screens/loginScreen.dart';
import 'package:truck/screens/otpScreen.dart';
import 'package:truck/services/auth_services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
//   final formKey = new GlobalKey<FormState>();

//   String phoneNo, verificationId, smsCode;

//   bool codeSent = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(hintText: 'Enter phone number'),
//                     onChanged: (val) {
//                       setState(() {
//                         this.phoneNo = val;
//                       });
//                     },
//                   )),
//                   codeSent ? Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(hintText: 'Enter OTP'),
//                     onChanged: (val) {
//                       setState(() {
//                         this.smsCode = val;
//                       });
//                     },
//                   )) : Container(),
//               Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: RaisedButton(
//                       child: Center(child: codeSent ? Text('Login'):Text('Verify')),
//                       onPressed: () {
//                         codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
//                       }))
//             ],
//           )),
//     );
//   }

//   Future<void> verifyPhone(phoneNo) async {
//     final PhoneVerificationCompleted verified = (AuthCredential authResult) {
//       AuthService().signIn(authResult);
//     };

//     final PhoneVerificationFailed verificationfailed =
//         (AuthException authException) {
//       print('${authException.message}');
//     };

//     final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
//       this.verificationId = verId;
//       setState(() {
//         this.codeSent = true;
//       });
//     };

//     final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
//       this.verificationId = verId;
//     };

//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phoneNo,
//         timeout: const Duration(seconds: 60),
//         verificationCompleted: verified,
//         verificationFailed: verificationfailed,
//         codeSent: smsSent,
//         codeAutoRetrievalTimeout: autoTimeout);
//   }
// }
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
      appBar: AppBar(
        title: Text("login page"),
      ),
      // width: MediaQuery.of(context).size.width * 0.4,
      body: Container(padding: EdgeInsets.only(left: 8.0, top: 90),
      alignment: Alignment.center,
      child: new RaisedButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        color: Colors.green,
        onPressed: () => {
           Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                       LoginScreen()
                                                  )),

        },
    //     child: new Container(
    //       child: new Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           new Expanded(
    //             child: new FlatButton(
    //               onPressed: () {
    //                 print("pressed");
    //                 showModalBottomSheet(
    //                     context: context,
    //                     isScrollControlled: true,
    //                     builder: (BuildContext bc) {
    //                       print("VALID CC: $isValid");

    //                       return StatefulBuilder(builder:
    //                           (BuildContext context, StateSetter state) {
    //                         return Container(
    //                           padding: EdgeInsets.all(16),
    //                           // height: MediaQuery.of(context).size.height * 0.7,
    //                           child: new Column(
    //                             mainAxisAlignment: MainAxisAlignment.start,
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: <Widget>[
    //                               Text(
    //                                 'LOGIN',
    //                                 style: TextStyle(
    //                                     fontSize: 18,
    //                                     fontWeight: FontWeight.w900,
    //                                     color: Colors.black),
    //                               ),
    //                               Text(
    //                                 'Login/Create Account',
    //                                 style: TextStyle(
    //                                     fontSize: 12,
    //                                     fontWeight: FontWeight.normal,
    //                                     color: Colors.black),
    //                               ),
    //                               Padding(
    //                                 padding: EdgeInsets.only(bottom: 0),
    //                                 child: TextFormField(
    //                                   keyboardType: TextInputType.number,
    //                                   controller: _phoneNumberController,
    //                                   autofocus: true,
    //                                   onChanged: (text) {
    //                                     validate(state);
    //                                   },
    //                                   decoration: InputDecoration(
    //                                     labelText: "10 digit mobile number",
    //                                     prefix: Container(
    //                                       padding: EdgeInsets.all(4.0),
    //                                       child: Text(
    //                                         "+91",
    //                                         style: TextStyle(
    //                                             color: Colors.black,
    //                                             fontWeight: FontWeight.bold),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                   autovalidate: true,
    //                                   autocorrect: false,
    //                                   maxLengthEnforced: true,
    //                                   validator: (value) {
    //                                     return !isValid
    //                                         ? 'Please provide a valid 10 digit phone number'
    //                                         : null;
    //                                   },
    //                                 ),
    //                               ),
    //                               Container(
    //                                 padding: EdgeInsets.all(16),
    //                                 child: Center(
    //                                   child: SizedBox(
    //                                     width:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.85,
    //                                     child: RaisedButton(
    //                                       color: !isValid
    //                                           ? Theme.of(context)
    //                                               .primaryColor
    //                                               .withOpacity(0.5)
    //                                           : Theme.of(context).primaryColor,
    //                                       shape: RoundedRectangleBorder(
    //                                           borderRadius:
    //                                               BorderRadius.circular(0.0)),
    //                                       child: Text(
    //                                         !isValid
    //                                             ? "ENTER PHONE NUMBER"
    //                                             : "CONTINUE",
    //                                         style: TextStyle(
    //                                             color: Colors.white,
    //                                             fontSize: 18.0,
    //                                             fontWeight: FontWeight.bold),
    //                                       ),
    //                                       onPressed: () {
    //                                         if (isValid) {
    //                                           Navigator.push(
    //                                               context,
    //                                               MaterialPageRoute(
    //                                                 builder: (context) =>
    //                                                     OTPScreen(
    //                                                   mobileNumber:
    //                                                       _phoneNumberController
    //                                                           .text,
    //                                                 ),
    //                                               ));
    //                                         } else {
    //                                           validate(state);
    //                                         }
    //                                       },
    //                                       padding: EdgeInsets.all(16.0),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         );
    //                       });
    //                     });
    //               },
                  padding: EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Phone",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
      ),),
    );
  }
}
  