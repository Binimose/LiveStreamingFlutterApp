
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ShowSnackBar(BuildContext context,String content){
  return ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
  content:Text(content)

));
}