import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/widgets/default_button.dart';
import 'package:travel_app/widgets/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class addPlaceForm extends StatefulWidget {
  @override
  _addPlaceFormState createState() => _addPlaceFormState();
}

class _addPlaceFormState extends State<addPlaceForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conform_password;
  String placeName;
  String placeDetail;
  bool remember = false;
  final List<String> errors = [];

  String lat;

  String placeUrl;

  String placePhone;

  String placeFromWhere;

  int selectitem;

  String selectedValue = "";

  File _image;

  final picker = ImagePicker();

  final List listPlaceValues = ['Аялах газар', 'Хоолны газар', 'Зочид буудал'];

  final List listTextValues = [
    'Архангай',
    'Баян-Өлгий',
    'Баянхонгор',
    'Булган',
    'Говь-Алтай',
    'Говьсүмбэр',
    'Дархан-Уул',
    'Дорноговь',
    'Дорнод',
    'Дундговь',
    'Завхан',
    'Орхон',
    'Өвөрхангай',
    'Өмнөговь',
    'Сүхбаатар',
    'Сэлэнгэ',
    'Төв',
    'Увс',
    'Ховд',
    'Хөвсгөл',
    'Хэнтий',
    'Улаанбаатар',
  ];

  var selectedPlace = "";

  int selectedItem;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                border: Border.all(color: AppColors.kPrimaryColor)),
            child: TextButton(

              child: _image == null
                  ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Зураг оруулах', style: TextStyle(color: AppColors.kPrimaryColor)),
                  )
                  : Container(
                constraints: BoxConstraints( maxHeight: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child:
                          Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ),),
                      ),
                    ),
              onPressed: () {
                _showPicker(context);
              },
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  border: Border.all(color: AppColors.kPrimaryColor)),
              child: CupertinoButton(
                alignment: Alignment.centerLeft,
                child: (selectedValue == "")
                    ? Text(
                        'Аймаг сонгох',
                        style: TextStyle(color: AppColors.kPrimaryColor),
                      )
                    : Text('$selectedValue',
                        style: TextStyle(color: AppColors.kPrimaryColor)),
                onPressed: () => showPicker(),
              )),
          SizedBox(height: getProportionateScreenHeight(30)),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  border: Border.all(color: AppColors.kPrimaryColor)),
              child: CupertinoButton(
                alignment: Alignment.centerLeft,
                child: (selectedPlace == "")
                    ? Text(
                        'Газрын төрөл сонгох',
                        style: TextStyle(color: AppColors.kPrimaryColor),
                      )
                    : Text('$selectedPlace',
                        style: TextStyle(color: AppColors.kPrimaryColor)),
                onPressed: () => showPlacePicker(),
              )),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPlaceNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPlaceLatFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPlaceDetailFormField(),
          Visibility(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(30)),
                buildPlaceUrlFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildPlacePhoneFormField(),
              ],
            ),
            visible: selectedItem == 1 || selectedItem == 2,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Нэмэх",
            press: () {
              if (_formKey.currentState.validate()) {
                print('true');
                _formKey.currentState.save();
                print('''
                $selectedValue,
                $selectedPlace,
                ner: $placeName,
                detail: $placeDetail,
                utas: $placePhone,
                url: $placeUrl,
                hayg: $lat
                ''');
              }
            },
          ),
        ],
      ),
    );
  }

  Future showPicker() async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              scrollController: FixedExtentScrollController(initialItem: 0),
              onSelectedItemChanged: (value) {
                setState(() {
                  if (value != null) {
                    selectedValue = listTextValues[value];
                  }
                });
              },
              itemExtent: 32.0,
              children: [for (var val in listTextValues) Text(val)],
            ),
          );
        });
  }

  Future showPlacePicker() async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              scrollController: FixedExtentScrollController(initialItem: 0),
              onSelectedItemChanged: (value) {
                setState(() {
                  if (value != null) {
                    selectedPlace = listPlaceValues[value];
                    selectedItem =
                        listPlaceValues.indexOf(listPlaceValues[value]);
                    print('$selectedItem');
                  }
                });
              },
              itemExtent: 32.0,
              children: [for (var val in listPlaceValues) Text(val)],
            ),
          );
        });
  }

  TextFormField buildPlaceNameFormField() {
    return TextFormField(
      onSaved: (newValue) => placeName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Газрын нэр",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
      ),
    );
  }

  TextFormField buildPlaceDetailFormField() {
    return TextFormField(
      onSaved: (newValue) => placeDetail = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Газрын дэлгэрэнгүй мэдээлэл",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
      ),
    );
  }

  TextFormField buildPlaceLatFormField() {
    return TextFormField(
      onSaved: (newValue) => lat = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Газрын дэлгэрэнгүй хаяг Lat, Lng",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
      ),
    );
  }

  TextFormField buildPlaceUrlFormField() {
    return TextFormField(
      onSaved: (newValue) => placeUrl = newValue,
      decoration: InputDecoration(
        hintText: "Газрын Website холбох",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
      ),
    );
  }

  TextFormField buildPlacePhoneFormField() {
    return TextFormField(
      onSaved: (newValue) => placePhone = newValue,
      decoration: InputDecoration(
        hintText: "Газрын утасны дугаар холбох",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          gapPadding: 10,
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Зургийн цомог'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Камер'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  _imgFromGallery() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
