import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// nomes das colunas do banco de dados
final String favoriteTable = "favoriteTable";
final String idFavoriteColumn = "idFavoriteColumn";
final String titleColumn = "nameColumn";
final String nameCategoryColumn = "nameCategoryColumn";
final String descriptionColumn = "descriptionColumn";
final String coverColumn = "coverColumn";
final String episodeColumn = "episodeColumn";
final String seasonColumn = "seasonColumn";

//

// classe responsável por ajudar no crud do banco de dados,
// como só precisamos de uma instancia dessa classe usandos o designer pattern singleton
class FavoriteHelper {
  static final FavoriteHelper _instance = FavoriteHelper.internal();

  factory FavoriteHelper() => _instance;

  FavoriteHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  // função para iniciar o banco de dados
  Future<Database> initDb() async {
    // pegando o path do bd
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "favorite.db");

    // abrindo o bd e criando as tabelas
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int newerVersion) async {
        await db.execute(
          "CREATE TABLE $favoriteTable($idFavoriteColumn INTEGER PRIMARY KEY, $titleColumn TEXT, $nameCategoryColumn TEXT, $descriptionColumn TEXT, $coverColumn TEXT, $episodeColumn INTEGER, $seasonColumn INTEGER)",
        );
      },
    );
  }

  // salvando um favorito criado (CREATE)
  Future<Favorite> saveFavorite(Favorite favorite) async {
    Database dbFavorite = await db;
    favorite.id = await dbFavorite.insert(favoriteTable, favorite.toMap());
    return favorite;
  }

  // pegando um favorito (READ)
  Future<Favorite> getFavorite(int id) async {
    Database dbFavorite = await db;
    List<Map> maps = await dbFavorite.query(favoriteTable,
        columns: [
          idFavoriteColumn,
          titleColumn,
          nameCategoryColumn,
          descriptionColumn,
          coverColumn,
          episodeColumn,
          seasonColumn,
        ],
        where: "$idFavoriteColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Favorite.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // atualizando um favorito (UPDATE)
  Future<int> updateFavorite(Favorite favorite) async {
    Database dbFavorite = await db;
    return await dbFavorite.update(
      idFavoriteColumn,
      favorite.toMap(),
      where: "$idFavoriteColumn = ?",
      whereArgs: [favorite.id],
    );
  }

  // deletando um favorito (DELETE)
  Future<int> deleteFavorite(int id) async {
    Database dbFavorite = await db;
    return await dbFavorite.delete(idFavoriteColumn,
        where: "$idFavoriteColumn = ?", whereArgs: [id]);
  }

  // pegando todos os favoritos e retorando como uma lista
  Future<List> getAllfavorite() async {
    Database dbFavorite = await db;
    List listMap = await dbFavorite.rawQuery("SELECT * FROM $favoriteTable");
    List<Favorite> listFavorite = List();
    for (Map m in listMap) {
      listFavorite.add(Favorite.fromMap(m));
    }
    return listFavorite;
  }

  // pegando o numero de favoritos da tabela
  Future<int> getNumber() async {
    Database dbFavorite = await db;
    return Sqflite.firstIntValue(
        await dbFavorite.rawQuery("SELECT COUNT(*) FROM $favoriteTable"));
  }

  //fechando o bd
  Future close() async {
    Database dbFavorite = await db;
    dbFavorite.close();
  }
}

// classe para criar favoritos
class Favorite {
  int id;
  String title;
  String description;
  String category;
  String cover;
  String episode;
  String season;

  Favorite();

  //contrutor que recebe um map e cria um favorito
  Favorite.fromMap(Map map) {
    id = map[idFavoriteColumn];
    title = map[titleColumn];
    description = map[descriptionColumn];
    category = map[nameCategoryColumn];
    cover = map[coverColumn];
    episode = map[episodeColumn];
    season = map[seasonColumn];
  }

  // função que transforma um favorito em um map
  Map toMap() {
    Map<String, dynamic> map = {
      titleColumn: title,
      descriptionColumn: description,
      nameCategoryColumn: category,
      coverColumn: cover,
      episodeColumn: episode,
      seasonColumn: season
    };
    if (id != null) {
      map[idFavoriteColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Favorite(id: $id, title: $title, description: $description, category: $category, cover: $cover, episode: $episode, season: $season)";
  }
}
