import 'package:cgpa_with_hive/models/hive/hivemodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TakeDatailsForm extends StatelessWidget {
  final intex;
  final Box<dynamic> cgpabox;
  final Function delete;

  final SaveToHive box;
  TakeDatailsForm({this.intex, this.cgpabox, this.delete, this.box});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    // String course;
    // double cgpa;
    // double credits;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'COURSE', border: InputBorder.none),
                  onChanged: (v) {
                    //course = v;
                    cgpabox.putAt(intex, SaveToHive(course: v));
                    print(box.course);
                    print(v);
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Credits', border: InputBorder.none),
                  validator: (v) {
                    print(v);
                    if (v.isEmpty) {
                      return 'Please Enter Credits';
                    } else if (double.parse(v) >= 4) {
                      return 'CGPA can\'t be more then 4.00';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (v) {
                    // credits = double.parse(v);
                    cgpabox.putAt(intex, SaveToHive(credits: double.parse(v)));
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'CGPA', border: InputBorder.none),
                  onChanged: (v) {
                    // cgpa = double.parse(v);
                    cgpabox.putAt(intex, SaveToHive(cgpa: double.parse(v)));
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  delete();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
