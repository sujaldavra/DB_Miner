import 'package:flutter_app/global.dart';
import 'package:flutter_app/modals/modals.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AplanetDBHelper {
  AplanetDBHelper._();

  static final AplanetDBHelper aplanetDBHelper = AplanetDBHelper._();

  final String dbname = 'data.db';
  final String tableName = 'animal';
  final String colPlan = 'plan';
  final String colPrice = 'price';
  final String colImage = 'image';

  Database? db;
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbname);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String query =
            "CREATE TABLE IF NOT EXISTS $tableName($colPlan TEXT,$colPrice TEXT,$colImage Text);";
        await db.execute(query);
      },
    );
  }

  Future<void> insertRecord(
      {required String plan,
      required String price,
      required String image}) async {
    await initDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;

    if (isInserted == false) {
      String query =
          "INSERT INTO $tableName ($colPlan,$colPrice,$colImage)VALUES(?,?,?);";
      List args = [
        plan,
        price,
        image,
      ];
      await db!.rawInsert(query, args);
    }
    prefs.setBool(tableName, true);
  }

  Future<List<Aplanet>> fetchAllRecords() async {
    List getAllDetail = Global.plan.map((e) => e).toList();

    getAllDetail.map((e) async {
      await AplanetDBHelper.aplanetDBHelper
          .insertRecord(plan: e['plan'], price: e['price'], image: e['image']);
    }).toList();

    await initDB();
    String query = "SELECT * FROM $tableName";

    List<Map<String, dynamic>> allAnimal = await db!.rawQuery(query);
    List<Aplanet> getAnimal =
        allAnimal.map((e) => Aplanet.fromAnimal(e: e)).toList();
    return getAnimal;
  }
}
