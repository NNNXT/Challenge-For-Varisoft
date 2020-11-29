import 'package:flutter/material.dart';
import 'package:opentalk/mockup/mockupData/mockupData.dart';
import 'package:opentalk/src/widget.dart/sizeText.dart';

class ChatPage extends StatefulWidget {
  ChatPage({
    @required this.detailOpenTalk
  });

  final detailOpenTalk;
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var detailOpenTalk;
  @override
  void initState() {
    detailOpenTalk = this.widget.detailOpenTalk;
    super.initState();
  }
  List historyChat = MockupData().historyChat;
  int countSenderBySomeone = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1D1D),
        title: Text(detailOpenTalk['title'] + ' (' + detailOpenTalk['member'] + ')'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.775,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/background.png'),
                fit: BoxFit.fill
              )
            ),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: MockupData().historyChat.length,
              itemBuilder: (context,i){
                if (historyChat[i]['sender'] == 'me') {
                  countSenderBySomeone = 0;
                } else {
                  countSenderBySomeone++;
                }
                return Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.0025),
                    child: historyChat[i]['type'] == 'text' ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                      child: Row(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (historyChat[i]['sender'] != 'me')
                                Padding(
                                  padding: EdgeInsets.only(right: size.height * 0.0125),
                                  child: countSenderBySomeone == 1 ? Image.asset(
                                    historyChat[i]['profileSender'],
                                    width: size.width * 0.1125,
                                  ) : Container(width: size.width * 0.11),
                                ),
                              Container(
                                margin: i == 0 ? EdgeInsets.only(top: size.height * 0.005) : i == MockupData().historyChat.length - 1 ? EdgeInsets.only(bottom: size.height * 0.005)  : null,
                                constraints: BoxConstraints(maxWidth: size.width * 0.75),
                                child: Wrap(
                                  alignment: WrapAlignment.end,
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  children: [
                                    SubTitleText(
                                      text: historyChat[i]['message'],
                                      foneSize: 0.016,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: size.height * 0.025),
                                      child: ContentText(
                                        text: historyChat[i]['time'],
                                        textColor: Colors.grey,
                                        foneSize: 0.013,
                                      ),
                                    ),
                                    if (historyChat[i]['sender'] == 'me')
                                      Image.asset(
                                        'assets/icons/read.png',
                                        width: size.height * 0.02,
                                      )
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                decoration: BoxDecoration(
                                  color: historyChat[i]['sender'] == 'me' ? Color(0xFFDCF7C5) : Color(0xFFFAFAFA),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: historyChat[i]['sender'] == 'me' ? Radius.circular(10) : countSenderBySomeone == 1 ? Radius.circular(0) : Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )
                                ),
                              ),
                            ],
                          ),
                        ],
                        mainAxisAlignment: historyChat[i]['sender'] == 'me' ? MainAxisAlignment.end : MainAxisAlignment.start,
                      ),
                    ) : historyChat[i]['type'] == 'image' ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                      child: Align(
                        alignment: historyChat[i]['sender'] == 'me' ? Alignment.centerRight : Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            historyChat[i]['message'],
                            width: size.width * 0.7,
                            height: size.height * 0.2,
                          ),
                        ),
                      ),
                    ) : Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: size.height * 0.0075),
                        color: Color(0xFFDDDDE9),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: size.height * 0.0025),
                          child: ContentText(
                            text: historyChat[i]['message'],
                            foneSize: 0.013,
                            textColor: Color(0xFF3C3C43),
                          ),
                        ),
                      )
                    )
                  ),
                );
              }
            ),
          ),
          Flexible(
            child: Container(
              color: Color(0xFFF6F6F6),
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: InkWell(
                            onTap: (){},
                            child: Image.asset(
                              'assets/icons/image.png',
                              width: size.width * 0.075,
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0xFF000000).withOpacity(0.05),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.525,
                                child: Padding(
                                  padding: EdgeInsets.only(left: size.width * 0.05),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Aa',
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
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: size.width * 0.025),
                                child: InkWell(
                                  onTap: (){},
                                  child: Image.asset(
                                    'assets/icons/emoji.png',
                                    width: size.width * 0.075,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Image.asset(
                            'assets/icons/like.png',
                            width: size.width * 0.075,
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          )
        ],
      )
    );
  }
}