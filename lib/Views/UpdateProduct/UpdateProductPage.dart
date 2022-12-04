import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../Models/Station_Travel.dart';
import '../select_photo_options_screen.dart';
import 'package:travelok_vietnam_app/Models/Station_Travel.dart';
import 'package:travelok_vietnam_app/Models/Repository/Repository_Travel.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({Key? key, required this.travel}) : super(key: key);

  final Travel travel;

  @override
  State<UpdateProductPage> createState() => _UpdateProductPage();
}

class _UpdateProductPage extends State<UpdateProductPage> {
  File? _image;
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
    final travel = widget.travel;
    String? imageUrl = widget.travel.imageUrl;
    var title = widget.travel.title;
    var description = widget.travel.description;
    var rating = widget.travel.rating;
    var price = widget.travel.price;
    var country = widget.travel.country;
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
          text: TextSpan(children: [
            TextSpan(
                text: '${travel.title}',
                style: const TextStyle(
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
              child: TextFormField(
                initialValue: travel.title,
                cursorColor: constants.AppColor.xBackgroundColor,
                onChanged: (value) {
                  title = value;
                },
                decoration: const InputDecoration(
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
              child: TextFormField(
                initialValue: travel.country,
                cursorColor: constants.AppColor.xBackgroundColor,
                onChanged: (value) {
                  country = value;
                },
                decoration: const InputDecoration(
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
              child: TextFormField(
                initialValue: travel.price.toString(),
                keyboardType: TextInputType.number,
                cursorColor: constants.AppColor.xBackgroundColor,
                onChanged: (value) {
                  price = int.parse(value);
                },
                decoration: const InputDecoration(
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
              child: TextFormField(
                initialValue: travel.rating.toString(),
                keyboardType: TextInputType.number,
                cursorColor: constants.AppColor.xBackgroundColor,
                onChanged: (value) {
                  rating = int.parse(value);
                },
                decoration: const InputDecoration(
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
              child: TextFormField(
                initialValue: travel.description,
                cursorColor: constants.AppColor.xBackgroundColor,
                onChanged: (value) {
                  description = value;
                },
                decoration: const InputDecoration(
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
                            ? Image(
                                image: NetworkImage(travel.imageUrl.toString()),
                              )
                            : Image(image: FileImage(_image!)),
                      ),
                    ))),

            const SizedBox(height: 40),

            // BUTTON UPDATE PRODUCT
            GestureDetector(
              onTap: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đang cập nhật...!')));
                if (_image == null) {
                  Travel travel = Travel(
                      id: widget.travel.id,
                      title: title,
                      country: country,
                      price: price,
                      rating: rating,
                      description: description,
                      imageUrl: imageUrl);
                  await RepositoryTravel().updateTravel(travel);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cập nhật thành công!')));
                } else {
                  String uniqueFileName =
                  DateTime.now().millisecondsSinceEpoch.toString();

                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages = referenceRoot.child('images');

                  Reference referenceImageToUpload =
                  referenceDirImages.child(uniqueFileName);
                  await referenceImageToUpload.putFile(File(_image!.path));
                  imageUrl = await referenceImageToUpload.getDownloadURL();

                  Travel travel = Travel(
                      id: widget.travel.id,
                      title: title,
                      country: country,
                      price: price,
                      rating: rating,
                      description: description,
                      imageUrl: imageUrl);
                  await RepositoryTravel().updateTravel(travel);
                  print("Cập nhật thành công!");
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cập nhật thành công!')));
                  Navigator.pop(context);
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
