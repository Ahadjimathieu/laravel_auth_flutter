import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class User {
  final int id;
  final String firstname;
  final String lastname;
  final String username;
  final String email;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      email: json['email'],
    );
  }
}