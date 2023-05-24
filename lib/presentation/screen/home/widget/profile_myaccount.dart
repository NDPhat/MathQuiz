import 'dart:io';
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/widget/app_bar.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:math/presentation/widget/login_input_field.dart';
import '../../../../application/cons/color.dart';
import 'package:image_cropper/image_cropper.dart';

class UpdateProfileUserScreen extends StatefulWidget {
  UpdateProfileUserScreen({
    Key? key,
  });
  @override
  State<UpdateProfileUserScreen> createState() =>
      _UpdateProfileUserScreenState();
}

class _UpdateProfileUserScreenState extends State<UpdateProfileUserScreen> {
  List<XFile>? _imageFileList;

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  final ImagePicker _picker = ImagePicker();
  Widget _previewImages() {
    if (_imageFileList != null) {
      return Image.file(File(_imageFileList![0].path));
    } else {
      return Image.asset("assets/images/profile.png");
    }
  }

  Widget handlePreview() {
    return _previewImages();
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Choose one :'),
            actions: <Widget>[
              TextButton(
                child: const Text('Gallery'),
                onPressed: () {
                  onPick('Gallery');
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('Camera'),
                  onPressed: () {
                    onPick('Camera');
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  Future<void> _onImageButtonPressed({required BuildContext context}) async {
    if (context.mounted) {
      await _displayPickImageDialog(context, (String typeOfChoose) async {
        try {
          final XFile? pickedFile;
          if (typeOfChoose == "Gallery") {
            pickedFile = await _picker.pickImage(
              source: ImageSource.gallery,
              maxHeight: 100,
              maxWidth: 100,
            );
          } else {
            pickedFile = await _picker.pickImage(
              source: ImageSource.camera,
              maxHeight: 100,
              maxWidth: 100,
            );
          }
          await ImageCropper.platform.cropImage(
              sourcePath: pickedFile!.path, maxWidth: 100, maxHeight: 100);
          setState(() {
            _setImageFileListFromFile(pickedFile);
          });
          // ignore: empty_catches
        } catch (e) {}
      });
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        if (response.files == null) {
          _setImageFileListFromFile(response.file);
        } else {
          _imageFileList = response.files;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(
              size: size,
              onBack: () {
                Navigator.pop(context);
              },
              textTitle: 'Update Profile',
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.05,
                  left: size.width * 0.05,
                  right: size.width * 0.05),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    // -- IMAGE with ICON
                    Stack(
                      children: [
                        Container(
                            width: size.width * 0.22,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(60)),
                                border: Border.all(color: colorSystemYeloow),
                                color: colorSystemWhite),
                            child: FutureBuilder<void>(
                                future: retrieveLostData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<void> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                    case ConnectionState.waiting:
                                    case ConnectionState.done:
                                      return CircleAvatar(
                                          radius: 20, child: handlePreview());
                                    case ConnectionState.active:
                                      if (snapshot.hasError) {
                                        return Image.asset(
                                            "assets/images/profile.png");
                                      } else {
                                        return Image.asset(
                                            "assets/images/profile.png");
                                      }
                                  }
                                })),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              _onImageButtonPressed(context: context);
                            },
                            child: Container(
                              width: 30,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: colorSystemYeloow),
                              child: const Row(
                                children: [
                                  Icon(
                                    LineAwesomeIcons.retro_camera,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.05),
                    LoginInputField(
                      width: size.width * 0.8,
                      height: size.height * 0.1,
                      hintText: 'Your full name',
                      icon: const Icon(
                        LineAwesomeIcons.user,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    LoginInputField(
                      width: size.width * 0.8,
                      height: size.height * 0.1,
                      hintText: 'Your phone',
                      icon: const Icon(
                        LineAwesomeIcons.phone,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    LoginInputField(
                      width: size.width * 0.8,
                      height: size.height * 0.1,
                      hintText: 'Your email',
                      icon: const Icon(
                        LineAwesomeIcons.mail_bulk,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    LoginInputField(
                      width: size.width * 0.8,
                      height: size.height * 0.1,
                      hintText: 'Your address',
                      icon: const Icon(
                        LineAwesomeIcons.location_arrow,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    RoundedButton(
                        press: () {},
                        color: colorMainBlue,
                        width: size.width * 0.8,
                        height: size.height * 0.08,
                        child: const Text(
                          'GO',
                          style: s16f700ColorSysWhite,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef OnPickImageCallback = void Function(String source);

class PngImagePainter extends CustomPainter {
  PngImagePainter({
    required this.image,
  });

  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    _drawCanvas(size, canvas);
    _saveCanvas(size);
  }

  Canvas _drawCanvas(Size size, Canvas canvas) {
    final center = Offset(150, 50);
    final radius = math.min(size.width, size.height) / 8;

    // The circle should be paint before or it will be hidden by the path
    Paint paintCircle = Paint()..color = Colors.black;
    Paint paintBorder = Paint()
      ..color = Colors.white
      ..strokeWidth = size.width / 36
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, paintCircle);
    canvas.drawCircle(center, radius, paintBorder);

    double drawImageWidth = 0;
    var drawImageHeight = -size.height * 0.8;

    Path path = Path()
      ..addOval(Rect.fromLTWH(drawImageWidth, drawImageHeight,
          image.width.toDouble(), image.height.toDouble()));

    canvas.clipPath(path);

    canvas.drawImage(image, Offset(drawImageWidth, drawImageHeight), Paint());
    return canvas;
  }

  _saveCanvas(Size size) async {
    var pictureRecorder = ui.PictureRecorder();
    var canvas = Canvas(pictureRecorder);
    var paint = Paint();
    paint.isAntiAlias = true;

    _drawCanvas(size, canvas);

    var pic = pictureRecorder.endRecording();
    ui.Image img = await pic.toImage(image.width, image.height);
    var byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    var buffer = byteData!.buffer.asUint8List();

    // var response = await get(imgUrl);
    var documentDirectory = await getApplicationDocumentsDirectory();
    File file = File(join(documentDirectory.path,
        '${DateTime.now().toUtc().toIso8601String()}.png'));
    file.writeAsBytesSync(buffer);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
