import 'dart:async';

import 'package:flutter/material.dart';
import 'package:opentalk/src/screen/landingPage.dart';
import 'package:opentalk/src/widget.dart/customButton.dart';
import 'package:opentalk/src/widget.dart/customCloseButton.dart';
import 'package:opentalk/src/widget.dart/sizeText.dart';

class ValidateOTPPage extends StatefulWidget {
  final String phone;

  ValidateOTPPage({
    @required this.phone
  });

  @override
  _ValidateOTPPageState createState() => _ValidateOTPPageState();
}

class _ValidateOTPPageState extends State<ValidateOTPPage> {
  static GlobalKey<FormState> _formKey;
  String otp;
  Timer _timer;
  int _start = 60;

  void countOTPAgain() {
    _start = 60;
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    countOTPAgain();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCloseButton(),
                    Container(
                      height: size.height * 0.3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.0375),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleText(text: 'ใส่รหัสยืนยัน'),
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.0175),
                              child: RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: 'รหัสยืนยันอยู่ในข้อความใน SMS ที่ส่งไปยังหมายเลขโทรศัพท์ ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: size.height * 0.020
                                    )
                                  ),
                                  TextSpan(
                                    text: this.widget.phone,
                                    style: TextStyle(
                                      color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.021
                                      )
                                    ),
                                  ]
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0375),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubTitleText(text: 'รหัสยืนยัน'),
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              maxLength: 6,
                              decoration: InputDecoration(counterText: ""),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty || value.length < 6) {
                                  return 'กรุณาตรวจสอบรหัส OTP อีกครั้ง';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                otp = value;
                              },
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.075),
                            child: ContentText(
                              text: 'ส่งรหัสอีกครั้ง $_start วิ',
                              textColor: Colors.grey
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: CustomButton(
                    text: 'เข้าสู่ระบบ',
                    onTap: (){
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage(0)));
                      }
                    }
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}