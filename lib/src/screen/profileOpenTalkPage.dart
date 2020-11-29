import 'package:flutter/material.dart';
import 'package:opentalk/src/widget.dart/customButton.dart';
import 'package:opentalk/src/widget.dart/customCloseButton.dart';
import 'package:opentalk/src/widget.dart/sizeText.dart';

class ProfileOpenTalkPage extends StatefulWidget {
  final detailOpenTalkPage;

  ProfileOpenTalkPage({
    @required this.detailOpenTalkPage
  });

  @override
  _ProfileOpenTalkPageState createState() => _ProfileOpenTalkPageState();
}

class _ProfileOpenTalkPageState extends State<ProfileOpenTalkPage> {
  var detailOpenTalkPage;
  @override
  void initState() {
    detailOpenTalkPage = this.widget.detailOpenTalkPage;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    CustomCloseButton(
                      canBack: false,
                    ),
                    Container(
                      height: size.height * 0.7,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.0375),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                detailOpenTalkPage['logo'],
                                width: size.width * 0.45,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: size.height * 0.03),
                                child: SubTitleText(text: detailOpenTalkPage['title']),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: size.height * 0.015,bottom: size.height * 0.02),
                                child: ContentText(
                                  text: detailOpenTalkPage['member'] + ' members',
                                  textColor: Colors.grey,
                                ),
                              ),
                              ContentText(
                                text: detailOpenTalkPage['subTitle'],
                                textColor: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: CustomButton(
                    text: 'เข้าร่วม',
                    onTap: (){
                      Navigator.pop(context,'join');
                    }
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}