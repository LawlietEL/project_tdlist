// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  bool? success;
  Data? data;
  String? message;

  TaskModel({
    this.success,
    this.data,
    this.message,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  String? usersId;
  String? task;
  String? dueDate;
  String? reminderDatetime;
  String? isImportant;
  String? isCompleted;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.usersId,
    this.task,
    this.dueDate,
    this.reminderDatetime,
    this.isImportant,
    this.isCompleted,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        usersId: json["users_id"],
        task: json["task"],
        dueDate: json["due_date"],
        reminderDatetime: json["reminder_datetime"],
        isImportant: json["is_important"],
        isCompleted: json["is_completed"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "users_id": usersId,
        "task": task,
        "due_date": dueDate,
        "reminder_datetime": reminderDatetime,
        "is_important": isImportant,
        "is_completed": isCompleted,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
