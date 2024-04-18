import 'package:mkrsupermarket/Models/Customer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DBHelper {

  static final DBHelper instance = DBHelper._init();
  static Database? _database;
  DBHelper._init();


  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mkrsupermarket.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute( '''
  CREATE TABLE $customerTable ( 
  ${CustomerFields.id} $idType, 
  ${CustomerFields.firstName} $textType,
  ${CustomerFields.lastName} $textType,
  ${CustomerFields.password} $textType,
  ${CustomerFields.mobileNumber} $textType,
  ${CustomerFields.emailAddress} $textType,
  ${CustomerFields.gender} $textType,
  ${CustomerFields.designation} $textType
  )
''' );
  }


  Future<Customer> insertCustomerDetails(Customer customer) async {
    final db = await instance.database;
    final id = await db.insert(customerTable, customer.toJson());
    return customer.copy(id: id);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

}