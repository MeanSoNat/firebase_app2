// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app2/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

class ItemService {
  Future<void> addItem(
      BuildContext context, Map<String, String> data, String docid) {
    print(data["id"]);
    return FirebaseFirestore.instance
        .collection('item')
        .doc()
        .set(data)
        .then((value) => {
              showMessageBox(
                context,
                "success",
                "Added item to firestore",
                // actions: [dismissButton(context)],
              )
            });
  }

  Future<void> SaveItem(
      BuildContext context, Map<String, String> data, String docid) {
    return FirebaseFirestore.instance
        .collection('item')
        .doc(docid)
        .update(data)
        .then((value) => {
              showMessageBox(
                context,
                "success",
                "Save item($docid) to firestore",
                // actions: [dismissButton(context)],
              )
            })
        .catchError((error) => {error.toString()});
  }

  Future<void> DeleteItem(
      BuildContext context, Map<String, String> data, String docid) {
    return FirebaseFirestore.instance
        .collection('item')
        .doc(docid)
        .delete()
        .then((value) => {
              showMessageBox(
                context,
                "success",
                "Delete item($docid)",
                // actions: [dismissButton(context)],
              )
            });
  }

  showMessageBox(BuildContext context, String s, String t) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(s),
        content: Text(t),
      ),
    );
  }

  // void showMessageBox(
  //   BuildContext context,
  //   String titleText,
  //   String contentText,
  // ) async {
  //   try {
  //     return showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //             title: Text(titleText),
  //             content: Text(contentText),
  //           );
  //         });
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
