import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/database.dart';
import 'package:flutter_application_1/Screens/HomeScreen.dart';
import 'package:flutter_application_1/Screens/MapLocation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/Model/user_model.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);
  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final TrailDescriptionEditingController = new TextEditingController();
  final TrailNameEditingController = new TextEditingController();

  String imageUrl = " ";

  double _ExperienceSliderValue = 0;

  double _SafetySliderValue = 0;

  Widget build(BuildContext context) {
    final ExperienceSlider = Slider(
      value: _ExperienceSliderValue,
      max: 5,
      divisions: 5,
      label: _ExperienceSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _ExperienceSliderValue = value;
        });
      },
    );

    final SafetySlider = Slider(
      value: _SafetySliderValue,
      max: 5,
      divisions: 5,
      label: _SafetySliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _SafetySliderValue = value;
        });
      },
    );

    final TrailNameField = TextFormField(
      autofocus: false,
      controller: TrailNameEditingController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Trail Name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid name(Min 3 characters)");
        }
        return null;
      },
      keyboardType: TextInputType.name,
      onSaved: (value) {
        TrailNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Trail Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final TrailDescriptionField = TextFormField(
      autofocus: false,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Description is required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid name(Min 3 characters)");
        }
        return null;
      },
      controller: TrailDescriptionEditingController,
      keyboardType: TextInputType.multiline,
      onSaved: (value) {
        TrailDescriptionEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Trail Description",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final CreateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 30, 13, 185),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          postDetailsToFirestore(
            TrailDescriptionEditingController,
            TrailNameEditingController,
            SafetySlider,
            ExperienceSlider,
            _auth,
            imageUrl,
          );
          print(imageUrl);
          Fluttertoast.showToast(msg: 'Trail Created');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Text(
          "Create",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final UploadButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 30, 13, 185),
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          // ignore: unnecessary_null_comparison
          onPressed: () async {
            _uploadImage();
            print(imageUrl);
          },
          child: Text(
            "Upload Image",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));

    final MapButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 30, 13, 185),
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          // ignore: unnecessary_null_comparison
          onPressed: () async {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MapPage()));
          },
          child: Text(
            "Choose Location",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 241, 243),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 95, 54, 244),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 45),
                      TrailNameField,
                      SizedBox(height: 20),
                      TrailDescriptionField,
                      SizedBox(
                        height: 20,
                      ),
                      Text("Experience"),
                      ExperienceSlider,
                      SizedBox(
                        height: 20,
                      ),
                      Text("Safety"),
                      SafetySlider,
                      SizedBox(
                        height: 20,
                      ),
                      (imageUrl != null)
                          ? Image.network(imageUrl)
                          : Placeholder(
                              fallbackHeight: 200.0,
                              fallbackWidth: double.infinity,
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CreateButton,
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  _uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    XFile image;
    image = (await _picker.pickImage(source: ImageSource.gallery))!;
    var file = File(image.path);
    if (image != null) {
      var snapshot = _storage.ref().child('folderName').putFile(file);

      var downLoadUrl = snapshot.snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downLoadUrl as String;
      });
    } else {
      Fluttertoast.showToast(msg: "No image selected");
    }
  }

  postDetailsToFirestore(
    TextEditingController trailDescriptionEditingController,
    TextEditingController trailNameEditingController,
    Slider safetySlider,
    Slider experienceSlider,
    FirebaseAuth _auth,
    String imageUrl,
  ) async {
    //calling our firestore
    //calling our Trail model
    //sending these values
    User? user = _auth.currentUser;
    DatabaseService(uid: user!.uid).CreateTrail(
      trailNameEditingController.text,
      trailDescriptionEditingController.text,
      safetySlider.value,
      experienceSlider.value,
      imageUrl,
    );
  }
}
