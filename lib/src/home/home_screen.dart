import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _imageFile;
  Offset offset = Offset.zero;
  String text = "";
  double _cWidth = 0;
  double _cHeight = 0;

  final _textController = TextEditingController();

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter text'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: 'Text'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(_textController.text);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                color: Color.fromARGB(255, 197, 223, 221),
                // height: 250,
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.center,
                child: _imageFile == null
                    ? Text('No image selected.')
                    : Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                child: Positioned(
                  left: offset.dx,
                  top: offset.dy,
                  child: GestureDetector(
                      onPanUpdate: (details) {
                        setState(() {
                          _cWidth = MediaQuery.of(context).size.width * 0.8;
                          _cHeight = MediaQuery.of(context).size.height / 3;

                          print("222222222$_cWidth");
                          print("00000....$offset");
                          offset = Offset(offset.dx + details.delta.dx,
                              offset.dy + details.delta.dy);
                          if (offset.dx < 0) {
                            offset = Offset(0, offset.dy + details.delta.dy);
                          }
                          if (offset.dx > _cWidth - 50) {
                            offset = Offset(
                                _cWidth - 50, offset.dy + details.delta.dy);
                          }
                          if (offset.dy < 0) {
                            offset = Offset(offset.dx + details.delta.dx, 0);
                          }
                          if (offset.dy > _cHeight - 50) {
                            offset = Offset(
                                offset.dx + details.delta.dx, _cHeight - 50);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(_textController.text,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                  color: Colors.red)),
                        ),
                      )),
                ),
              )
            ]),
            SizedBox(
              height: 20,
            ),
            // Text(_textController.text),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: FloatingActionButton.extended(
              heroTag: "btn1",
              onPressed: () {
                print("Image button pressed 43");
                _pickImage(ImageSource.gallery);
              },
              tooltip: 'Pick Image from gallery',
              icon: Icon(Icons.photo_library),
              label: Text("Change image"),
            ),
          ),
          FloatingActionButton.extended(
            heroTag: "btn2",
            onPressed: () async {
              await _showDialog();
              setState(() {});
            },
            tooltip: 'Pick Image from gallery',
            icon: Icon(Icons.edit),
            label: Text("Change Text"),
          ),
        ],
      ),
    );
  }
}
