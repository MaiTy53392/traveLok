import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../select_photo_options_screen.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPage();
}

class _AddProductPage extends State<AddProductPage> {
  File? _image;
  String imageUrl = '';
  var title = "";
  var description = "";
  var rating = 0;
  var price = 0;
  var country = "Không xác định";
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
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");

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
                text: 'Thêm địa điểm mới',
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
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: <Widget>[
            // INPUT TITLE
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: constants.AppColor.xGrayBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                cursorColor: constants.AppColor.xBackgroundColor,
                onChanged: (value) {
                  title = value;
                },
                decoration: const InputDecoration(
                  hintText: "Tên địa điểm",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            // INPUT country
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
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                cursorColor: constants.AppColor.xBackgroundColor,
                onChanged: (value) {
                  country = value;
                },
                decoration: const InputDecoration(
                  hintText: "Thành phố",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            // INPUT price
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
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: constants.AppColor.xBackgroundColor,
                onChanged: (value) {
                  price = int.parse(value);
                },
                decoration: const InputDecoration(
                  hintText: "Giá phòng",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            // INPUT rating
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
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: constants.AppColor.xBackgroundColor,
                onChanged: (value) {
                  rating = int.parse(value);
                },
                decoration: const InputDecoration(
                  hintText: "Đánh giá",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            // INPUT description
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
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                cursorColor: constants.AppColor.xBackgroundColor,
                onChanged: (value) {
                  description = value;
                },
                decoration: const InputDecoration(
                  hintText: "Mô tả",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            // IMAGE
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _showSelectPhotoOptions(context);
                    },
                    child: Center(
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                        ),
                        child: _image == null
                            ? const Center(
                                child: Text("Thêm hình ảnh"),
                              )
                            : Image(image: FileImage(_image!)),
                      ),
                    ))),

            const SizedBox(height: 40),

            // BUTTON CREATE PRODUCT
            GestureDetector(
              onTap: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đang thêm...!')));
                if (_image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Bạn đã thiếu hình ảnh!')));
                } else {
                  String uniqueFileName =
                      DateTime.now().millisecondsSinceEpoch.toString();

                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages = referenceRoot.child('images');

                  Reference referenceImageToUpload =
                      referenceDirImages.child(uniqueFileName);
                  await referenceImageToUpload.putFile(File(_image!.path));
                  imageUrl = await referenceImageToUpload.getDownloadURL();

                  products
                      .add({
                        'title': title,
                        'country': country,
                        'price': price,
                        'rating': rating,
                        'description': description,
                        'imageUrl': imageUrl
                      })
                      .then((value) => {
                            print("Thêm mới thành công!"),
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Thêm thành công!'))
                            ),
                    Navigator.pop(context)
                          })
                      .catchError(
                          (error) => print("Lỗi khởi tạo: ${error.message}"));
                }
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
                  "Thêm địa điểm",
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
