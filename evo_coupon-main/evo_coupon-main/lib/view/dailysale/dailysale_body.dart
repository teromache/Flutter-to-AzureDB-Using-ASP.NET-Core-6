//import '../../size_config.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../core/constants/constants.dart';

class DailySaleBody extends StatelessWidget {
  const DailySaleBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 129, 6, 150),
                  ),
                ),
                Container(
                  height: 750.0,
                  color: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    decoration:  const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          //start sini........................
                          Container(
                            margin: EdgeInsets.only(
                                top: 16, left: 16, right: 16, bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Transaction',
                                    style: secondaryTextStyle(
                                      size: 18,
                                    )),
                                Container(
                                  padding: EdgeInsets.only(left: 16, right: 5),
                                  height: 34,
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                        color: Colors.grey.withAlpha(50)),
                                  ),
                                  child: DropdownButton(
                                    value: 'Weekly',
                                    underline: SizedBox(),
                                    items: <String>[
                                      'Daily',
                                      'Weekly',
                                      'Monthly',
                                      'Yearly'
                                    ].map(
                                      (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,
                                              style:
                                                  primaryTextStyle(size: 14)),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (dynamic value) {},
                                  ),
                                )
                              ],
                            ),
                          ),
                          ListView.separated(
                            separatorBuilder: (_, index) => Divider(),
                            padding: EdgeInsets.all(8),
                            itemCount: 10,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              //OPPickVerifyModel data = transactionList[index];

                              return Container(
                                margin: EdgeInsets.only(
                                    left: 16, right: 16, bottom: 8),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.green.withOpacity(0.2),
                                              radius: 20,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 50,
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const <Widget>[
                                                Text('Hello'),
                                                SizedBox(height: 4),
                                                Text("Hihihihih"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              SizedBox(height: 10),
                                              Text('huhuhuh'),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ).onTap(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //
  }
}
