import 'package:flutter/material.dart';
import 'package:opentalk/mockup/mockupData/mockupData.dart';
import 'package:opentalk/src/screen/chatPage.dart';
import 'package:opentalk/src/screen/landingPage.dart';
import 'package:opentalk/src/screen/profileOpenTalkPage.dart';
import 'package:opentalk/src/widget.dart/sizeText.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List openTalkList = MockupData().openTalkList;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(text: 'OPENTALK'),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.025),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF000000).withOpacity(0.05),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF000000).withOpacity(0.05)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF000000).withOpacity(0.05)),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF000000).withOpacity(0.05)),
                              ),
                            ),
                          ),
                        )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.025),
                      child: Image.asset('assets/images/banner.png'),
                    )
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: openTalkList.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.01),
                      child: ListTile(
                        leading: Image.asset(openTalkList[i]['logo']),
                        title: Text(openTalkList[i]['title']),
                        subtitle: Text(openTalkList[i]['subTitle'] + "\n" + openTalkList[i]['member'] + " members"),
                        onTap: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileOpenTalkPage(
                            detailOpenTalkPage: openTalkList[i],
                          ))).then((value) {
                            if (value == 'join') {
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage(1)));
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(
                                detailOpenTalk: openTalkList[i],
                              )));
                            }
                          }) ;
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}