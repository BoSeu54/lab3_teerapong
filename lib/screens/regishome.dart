import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab3/models/amazonmenu.dart';
import 'package:lab3/models/classes.dart';
import 'package:lab3/models/csit.dart';

import 'package:lab3/models/ddmajor.dart';

class Regiswidgets extends StatefulWidget {
  const Regiswidgets({Key? key}) : super(key: key);

  @override
  _RegiswidgetsState createState() => _RegiswidgetsState();
}

class _RegiswidgetsState extends State<Regiswidgets> {
  final _formkay = GlobalKey<FormState>();

  //declare
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _id = TextEditingController();

  //classes
  String? groupclasses;
  List<Classes>? classes;
  //csit
  String? groupcsit;
  List<TCsit>? csit;
  //ddmajor
  List<ListMajor>? major = ListMajor.getMajor();
  late List<DropdownMenuItem<ListMajor>> _dropdownMenuItem;
  late ListMajor _selectedTypeItem;
  //AMAZON
  List checkMenu = [];
  List<Menu>? menu;
//
  @override
  void initState() {
    super.initState();
    classes = Classes.getClass();
    csit = TCsit.getCsit();
    _dropdownMenuItem = createDropdownMenuItem(major!);
    _selectedTypeItem = _dropdownMenuItem[0].value!;
    menu = Menu.getMenu();
  }

  List<DropdownMenuItem<ListMajor>> createDropdownMenuItem(
      List<ListMajor> major) {
    List<DropdownMenuItem<ListMajor>> items = [];

    for (var item in major) {
      items.add(DropdownMenuItem(
        child: Text(item.mname!),
        value: item,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Student Form',
          style: GoogleFonts.itim(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Form(
          key: _formkay,
          child: ListView(
            children: [
              logopic(),
              header(),
              dividingline(),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 15, bottom: 5),
                child: Text(
                  'ข้อมูลส่วนตัว',
                  style: GoogleFonts.mali(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              firstname(),
              lastname(),
              stid(),
              dividingline(),
              classwidget(),
              dividingline(),
              majorwidget(),
              dividingline(),
              faculty(),
              dividingline(),
              amzmenuwidget(),
              dividingline(),
              submitBT(),
            ],
          ),
        ),
      ),
    );
  }

  Widget submitBT() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 30, 50),
          child: ElevatedButton(
            onPressed: () {
              if (_formkay.currentState!.validate()) {
                print(_firstname.text);
              }
            },
            child: Text('ยืนยันข้อมูล',
                style: GoogleFonts.mali(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ],
    );
  }

  Widget amzmenuwidget() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'เมนูใน Amazon Cafe ที่ชอบ',
                style:
                    GoogleFonts.mali(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 20),
          child: Column(
            children: createCheckboxMenu(),
          ),
        ),
      ],
    );
  }

  List<Widget> createCheckboxMenu() {
    List<Widget> listMenu = [];
    for (var amzmenu in menu!) {
      listMenu.add(
        CheckboxListTile(
          value: amzmenu.checked,
          title: Text(amzmenu.engname!,
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
          subtitle: Text('${amzmenu.price} บาท',
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
          onChanged: (value) {
            setState(() {
              amzmenu.checked = value;
            });
          },
        ),
      );
    }
    return listMenu;
  }

  Widget classwidget() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'ชั้นปีที่กำลังศึกษา',
                style:
                    GoogleFonts.mali(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Column(
            children: radioClass(),
          ),
        ),
      ],
    );
  }

  Widget majorwidget() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'สาขาวิชาที่กำลังศึกษา',
                style:
                    GoogleFonts.mali(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Column(
            children: radiocsit(),
          ),
        ),
      ],
    );
  }

  Widget faculty() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'คณะที่กำลังศึกษา',
                style:
                    GoogleFonts.mali(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 40),
              child: DropdownButton(
                items: _dropdownMenuItem,
                style: GoogleFonts.krub(fontSize: 17, color: Colors.black),
                value: _selectedTypeItem,
                onChanged: (ListMajor? value) {
                  setState(() {
                    _selectedTypeItem = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> radiocsit() {
    List<Widget> listCsit = [];
    for (var tcsit in csit!) {
      listCsit.add(
        RadioListTile<dynamic>(
          title: Text(tcsit.name!,
              style: GoogleFonts.mali(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )),
          value: tcsit.checked!,
          groupValue: groupcsit,
          onChanged: (value) {
            setState(() {
              groupcsit = value;
            });
          },
        ),
      );
    }
    return listCsit;
  }

  List<Widget> radioClass() {
    List<Widget> listClasses = [];
    for (var stdclass in classes!) {
      listClasses.add(
        RadioListTile<dynamic>(
          title: Text(stdclass.name!,
              style: GoogleFonts.mali(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )),
          value: stdclass.checked!,
          groupValue: groupclasses,
          onChanged: (value) {
            setState(() {
              groupclasses = value;
            });
          },
        ),
      );
    }
    return listClasses;
  }

  Widget stid() {
    return Container(
      padding: const EdgeInsets.fromLTRB(70, 5, 70, 5),
      child: TextFormField(
        controller: _id,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter Your ID";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: 'Student ID',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)))),
      ),
    );
  }

  Widget lastname() {
    return Container(
      padding: const EdgeInsets.fromLTRB(70, 5, 70, 5),
      child: TextFormField(
        controller: _lastname,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter Your Firstname";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: 'Lastname',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)))),
      ),
    );
  }

  Widget firstname() {
    return Container(
      padding: const EdgeInsets.fromLTRB(70, 10, 70, 5),
      child: TextFormField(
        controller: _firstname,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter Your Firstname";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: 'Firstname',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)))),
      ),
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Students Registration',
            style: GoogleFonts.mali(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Padding logopic() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Image.asset(
        'images/tsu.png',
        fit: BoxFit.contain,
        height: 160,
        width: 50,
      ),
    );
  }

  Row dividingline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Text('------------------------------------------------------'),
        ),
      ],
    );
  }
}
