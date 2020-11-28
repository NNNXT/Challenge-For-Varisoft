import 'package:flutter/material.dart';
import 'package:opentalk/src/screen/validateOTPPage.dart';
import 'package:opentalk/src/widget.dart/customButton.dart';
import 'package:opentalk/src/widget.dart/customCloseButton.dart';
import 'package:opentalk/src/widget.dart/sizeText.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static GlobalKey<FormState> _formKey;
  String phone;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
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
          child: Center(
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
                              TitleText(text: 'เข้าสู่ระบบ OPENTALK'),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: size.height * 0.0175),
                                child: SubTitleText(text: 'ใส่หมายเลขโทรศัพท์ของอุปกรณ์ที่คุณใช้อยู่ในขณะนี้'),
                              ),
                              ContentText(
                                text: 'โปรดอ่านและยอมรับข้อกำหนดการใช้บริการและนโยบายความเป็นส่วนตัวของ OPENCHAT ก่อนใส่หมายเลขโทรศัพท์แล้วแตะปุ่มไปต่อ',
                                textColor: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.0375),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubTitleText(text: 'เบอร์โทรศัพท์'),
                            Form(
                              key: _formKey,
                              child: TextFormField(
                                maxLength: 10,
                                decoration: InputDecoration(counterText: ""),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value.isEmpty || value.length < 10) {
                                    return 'กรุณาตรวจสอบเบอร์โทรอีกครั้ง';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  phone = value;
                                },
                              )
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
                      showNavigateNextIcon: true,
                      text: 'ยืนยันเบอร์โทรศัพท์',
                      onTap: (){
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ValidateOTPPage(phone: phone)));
                        }
                      }
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}