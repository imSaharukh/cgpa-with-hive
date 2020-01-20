import 'package:cgpa_with_hive/models/hive/hivemodel.dart';
import 'package:cgpa_with_hive/screens/widgets/circle.dart';
import 'package:cgpa_with_hive/screens/widgets/takedetailsform.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    int ii = 0;
    final cgpaBox = Hive.box('CGPA');

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('Enter Your Data'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleTop(
                  title: 'CGPA',
                  number: '0.00',
                ),
                CircleTop(
                  title: 'CREDITS',
                  number: '0.00',
                )
              ],
            ),
            WatchBoxBuilder(
                box: Hive.box('CGPA'),
                builder: (context, cgpaBox) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: cgpaBox.length,
                    itemBuilder: (context, i) {
                      print(i);
                      final som = cgpaBox.getAt(i) as SaveToHive;
                     // print(som);
                      // gethivedata({fcourse, fcgpa, fcredits}) {
                      //   if (fcourse != null) {
                      //     return som.course;
                      //   } else if (fcgpa != null) {
                      //     return som.cgpa;
                      //   } else if (fcredits != null) {
                      //     return som.credits;
                      //   } else
                      //     print('err');
                      //   return null;
                      // }

                      void hivedelete() {
                        cgpaBox.deleteAt(i);
                      }

                      return TakeDatailsForm(
                        intex: i,
                        delete: hivedelete,
                        //cgpabox was not passed as parameter
                        cgpabox: cgpaBox,
                        box: som,
                      );
                    },
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          cgpaBox.add(SaveToHive(cgpa: 0));
        },
      ),
    );
  }

  // @override
  // void dispose() {
  //   Hive.close();
  //   // Hive.deleteFromDisk();
  //   super.dispose();
  // }
}
