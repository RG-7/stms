import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'utlis.dart';

void httpErrorhandle({
  required http.Response resposne,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (resposne.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(
        context,
        jsonDecode(resposne.body)['msg'],
      );
      break;
    case 500:
      showSnackBar(
        context,
        jsonDecode(resposne.body)['error'],
      );
      break;
    default:
      showSnackBar(
        context,
        resposne.body,
      );
      break;
  }
}
