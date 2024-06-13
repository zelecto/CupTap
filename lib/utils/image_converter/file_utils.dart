import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

Future<Uint8List> convertImageToBytes(XFile image) async {
  final Uint8List imageBytes = await image.readAsBytes();
  return imageBytes;
}
