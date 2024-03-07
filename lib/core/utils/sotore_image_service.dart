// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// final FirebaseStorage storage = FirebaseStorage.instance;
// final FirebaseFirestore firestore = FirebaseFirestore.instance;

// class StoreData {
//   Future<String> uploadImageToStorage(String childName, Uint8List file) async {
//     Reference ref = storage.ref().child(childName);
//     UploadTask uploadTask = ref.putData(file);
//     TaskSnapshot snapshot = await uploadTask;
//     String downloadUrl = await snapshot.ref.getDownloadURL();
//     return downloadUrl;
//   }

//   Future<String> saveData({
//     required Uint8List file,
//   }) async {
//     String resp = "Some Error Occurred";
//     try {
//       String imageUrl = await uploadImageToStorage('profileImage', file);

//       await firestore.collection('users').add({
//         'userimage': imageUrl,
//       });
//       resp = 'success';
//     } catch (err) {
//       resp = err.toString();
//     }
//     return resp;
//   }
// }
