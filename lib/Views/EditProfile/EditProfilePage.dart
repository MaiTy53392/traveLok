import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../select_photo_options_screen.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _image;
  String imageUrl = '';
  var currentUser = FirebaseAuth.instance.currentUser;

  final TextEditingController _displayNameTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController =
      TextEditingController();

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    _displayNameTextController.text = currentUser!.displayName.toString();
    _emailTextController.text = currentUser!.email.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            // Write Router
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: constants.AppColor.xIconBackgroundColor,
          ),
        ),
        title: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: 'Cập nhật thông tin',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black))
          ]),
        ),
      ),
      backgroundColor: constants.AppColor.xOverViewBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            //INPUT AVATAR
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _showSelectPhotoOptions(context);
                  },
                  child: Center(
                    child: Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200,
                        ),
                        child: Center(
                            child: _image == null
                                ? currentUser?.photoURL == null
                                ?
                                const CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
                                )
                                : CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                    currentUser!.photoURL.toString()
                                )
                            )
                                : CircleAvatar(
                              backgroundImage: FileImage(_image!),
                              radius: 200.0,
                            )

                        )
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(DateFormat('dd/MM/yyyy').format(currentUser!.metadata.creationTime as DateTime)),
            ),
            //INPUT DISPLAYNAME
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: constants.AppColor.xGrayBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                controller: _displayNameTextController,
                cursorColor: constants.AppColor.xBackgroundColor,
                decoration: const InputDecoration(
                  hintText: "Tên hiển thị",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            //INPUT PHONENUMBER
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: constants.AppColor.xGrayBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _passwordTextController,
                cursorColor: constants.AppColor.xBackgroundColor,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: "Mật khẩu",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            // INPUT EMAIL
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: constants.AppColor.xGrayBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                controller: _emailTextController,
                cursorColor: constants.AppColor.xBackgroundColor,
                decoration: const InputDecoration(
                  hintText: "Email của bạn",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // BUTTON update
            GestureDetector(
              onTap: () async {
                showDialog(context: context, builder: (context) {
                  return const Center(child: CircularProgressIndicator());
                });
                if (_image == null) {
                  try {
                    await currentUser
                        ?.updateDisplayName(_displayNameTextController.text);
                    await currentUser?.updateEmail(_emailTextController.text);
                  } catch (error) {
                    print(error);
                  }
                } else {
                  String uniqueFileName =
                      DateTime.now().millisecondsSinceEpoch.toString();

                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages = referenceRoot.child('images');

                  Reference referenceImageToUpload =
                      referenceDirImages.child(uniqueFileName);
                  try {
                    //Store the file
                    await referenceImageToUpload.putFile(File(_image!.path));
                    //Success: get the download URL
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                    await currentUser?.updatePhotoURL(imageUrl);
                    await currentUser
                        ?.updateDisplayName(_displayNameTextController.text.trim());
                    await currentUser?.updateEmail(_emailTextController.text.trim());
                    await currentUser?.updatePassword(_passwordTextController.text.trim());
                  } catch (error) {
                    print(error);
                  }
                }
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  color: constants.AppColor.xBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: const Text(
                  "Cập nhật",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
