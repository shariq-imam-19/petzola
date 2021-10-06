import 'package:flutter/material.dart';

class ReminderModel{
  var time;
  var date;
  var month;
  var title;
  var note;

  ReminderModel({this.title, this.date, this.month, this.time, this.note});

  ReminderModel.fromModel(ReminderModel item){
    this.title = item.title;
    this.date = item.date;
    this.month = item.month;
    this.time = item.time;
    this.note = item.note;
  }

  ReminderModel.fromJson(Map<String, dynamic> json){
    time = json['time'];
    date = json['date'];
    month = json['month'];
    title = json['title'];
    note = json['note'];
  }

}