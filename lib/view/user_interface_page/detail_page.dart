import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_word/core/components/cards/card.dart';
import 'package:my_word/core/constants/colors/colors.dart';
import 'package:my_word/core/service/status_service.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  StatusService _statusService = StatusService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favori Kelimelerim",
          style: TextStyle(
              fontSize: context.dynamicHeight(0.05),
              fontWeight: FontWeight.bold,
              fontFamily: 'IndieFlower'),
        ),centerTitle: true
        ,
        backgroundColor: containerColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _statusService.getStatus(),
          builder: ((context, snaphot) {
            return !snaphot.hasData
                ? CircularProgressIndicator()
                : ListView.builder(
                itemCount: snaphot.data!.docs.length,
                itemBuilder: ((context, index) {
                  DocumentSnapshot mypost = snaphot.data!.docs[index];

                  return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.delete,
                              color: myWhite,
                            ),
                            SizedBox(
                              width: context.dynamicWidth(0.03),
                            ),
                            Text(
                              "DELETE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'IndieFlower',
                                  color: myWhite,
                                  fontSize: context.dynamicHeight(0.03)),
                            ),
                            SizedBox(
                              width: context.dynamicWidth(0.03),
                            )
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          _statusService.removeStatus(mypost.id);
                        });
                      },
                      child: GestureDetector(
                          onTap: () {},
                          child: CardWidget(
                            textIngilizce: "${mypost["ingilizce"]}",
                            textTurkce: "${mypost["turkce"]}",
                            durum: mypost["durum"],
                            function: () {},
                          )));
                }));
          })),
    );
  }
}