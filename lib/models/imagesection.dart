// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageTaking extends StatefulWidget {
  var url;
  // ImageTaking(this.imagepickfn);
  // final void Function(File pickedImage) imagepickfn;

  @override
  _ImageTakingState createState() => _ImageTakingState();
}

class _ImageTakingState extends State<ImageTaking> {
  UploadTask? uploadTask;
  var _storedImage;
  var ref;
  var url;
  var image;
  var downurl;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> _imagepicker() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = File(imageFile!.path);
    });
    //widget.imagepickfn(_storedImage);
    final User? user = auth.currentUser;
    final uid = user!.uid;
    ref = FirebaseStorage.instance
        .ref()
        .child('userImage')
        .child(user.uid + '.jpg');

    // here you write the codes to input the data into firestore
    uploadTask = ref.putFile(_storedImage);
    // ignore: unnecessary_cast
    //url = await ref.getDownloadURL();
    var downurl = await (await uploadTask)!.ref.getDownloadURL();
    url = downurl.toString();
    //print(url);
  }

  // final ref = FirebaseStorage.instance.ref().child('userImage').child(auth.user!.uid + '.jpg');
  // Future<String> linking() async {
  //   final User? user = auth.currentUser;
  //   // ignore: unused_local_variable
  //   final uid = user!.uid;
  //   ref = FirebaseStorage.instance
  //       .ref()
  //       .child('userImage')
  //       .child(user.uid + '.jpg');
  //    downurl = await (await uploadTask)!.ref.getDownloadURL();
  //   url = downurl;
  //   return url.toString();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Image.asset('lib/images/panda.png', height: 50, width: 50),
        FlatButton.icon(
          onPressed: _imagepicker,
          icon: Icon(Icons.camera),
          label: Text(
            'take a photo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
