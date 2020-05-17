import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:primeiroapp/classes/favorite.dart';

class FavoriteMovieProvider with ChangeNotifier {
  Map<String, Favorite> _items = Map<String, Favorite>();

  List<Favorite> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Favorite byIndex(int i) {
    return _items.values.elementAt(i);
  }

  watched(Favorite fav) {
    if (fav == null) {
      return false;
    }
    if (fav.id != null &&
        fav.id.trim().isNotEmpty &&
        _items.containsKey(fav.id)) {
      _items[fav.id] = Favorite(
          id: fav.id,
          type: 'movie',
          title: fav.title,
          category: fav.category,
          description: fav.description,
          watched: !fav.watched,
          cover: fav.cover);
    }
    notifyListeners();
    return _items[fav.id].watched;
  }

  void put(Favorite fav) {
    if (fav == null) {
      return;
    }
    if (fav.id != null &&
        fav.id.trim().isNotEmpty &&
        _items.containsKey(fav.id)) {
      _items[fav.id] = Favorite(
          id: fav.id,
          type: 'movie',
          title: fav.title,
          category: fav.category,
          description: fav.description,
          watched: fav.watched,
          cover: fav.cover);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Favorite(
            id: id,
            type: 'movie',
            title: fav.title,
            category: fav.category,
            description: fav.description,
            watched: false,
            cover: fav.cover),
      );
    }

    notifyListeners();
  }

  void remove(Favorite fav) {
    if (fav != null && fav.id != null) {
      _items.remove(fav.id);
      notifyListeners();
    }
  }
}
