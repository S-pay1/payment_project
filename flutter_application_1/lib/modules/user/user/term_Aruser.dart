// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/user/signup/Signup.dart';
import 'package:flutter_application_1/modules/user/user/termsuser.dart';

import '../../../shared/components/components.dart';

class usertermAr extends StatefulWidget {
  const usertermAr({Key key}) : super(key: key);

  @override
  State<usertermAr> createState() => _usertermArState();
}

class _usertermArState extends State<usertermAr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => termsUser()));
                },
                child: Text(
                  'EN',
                  style: TextStyle(color: Colors.blue[800]),
                ))
          ],
          title: Text(
            'الشروط والاحكام   ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Container(
                    width: 400,
                    height: 180,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                          "تعد إجراءات الخدمة جزءًا لا يتجزأ من الشروط والأحكام. من خلال التسجيل لاستخدام الخدمة ، فإنك توافق على اتباع إجراءات الخدمة ، واستخدام الخدمة فقط للأغراض الحسنة النية المشروعةت. ",
                          style: TextStyle(fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "رسوم الخدمة: تحدد S-Pay رسوم الخدمة لكل معاملة ، بشرط أن تضيف هذه الرسوم إلى المبلغ الإجمالي الذي يتعين دفعه ثم تقوم بخصم المبلغ الإجمالي. يقدم S-Pay إشعارًا بالمبلغ الإجمالي بعد إضافة رسوم الخدمة قبل كل معاملة حتى تتمكن من القبول أو الرفض لإتمام عملية الدفع ، وبالموافقة على إكمال العملية ، فهذه موافقتك على خصم مصاريف الخدمة بالإضافة إلى إلى المبلغ الذي سيتم دفعه من حسابك.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ":اسباب حدوث اخطاء في عمليه الدفع ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff003B75),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "١-إذا كان الرصيد غير كافٍ لإتمام عملية السداد  ا",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "٢-إذا تجاوز السداد الحد الائتماني المتاح",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "٣-عدم الامتثال لشروط وأحكام الاستخدامة",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  defaultButton(
                      text: 'موافقه',
                      function: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      })
                ]))));
  }
}
