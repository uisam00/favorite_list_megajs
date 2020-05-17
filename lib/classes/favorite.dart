import 'dart:io';

import 'package:flutter/material.dart';

class Favorite {
  final String id;
  final String title;
  final String description;
  final String category;
  final File cover;
  final String type;
  final String episode;
  final String season;

  bool watched;

  Favorite({
    this.episode,
    this.season,
    this.watched,
    this.id,
    this.type,
    this.category,
    @required this.title,
    @required this.description,
    this.cover,
  });
}
