import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String idColum = "idColum";
final String nameColum = "nameColum";
final String emailColum = "emailColum";
final String telefoneColum = "telefoneColum";
final String imgColum = "imgColum";


class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();
  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  get db {
    if (_db != null){
      return _db;
    }else{
      _db = initDb();
    }
  }
  initDb()async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "contact.db");
  }
}

class Contact {
  int id;
  String name;
  String email;
  String telefone;
  String img;

  Contact.fromMap(Map map){
    id = map[idColum];
    name = map[nameColum];
    email = map[emailColum];
    telefone = map[telefoneColum];
    img = map[imgColum];
  }


  Map toMap() {
    Map<String, dynamic> map = {
      nameColum: name,
      emailColum: email,
      telefoneColum: telefone,
      imgColum: img,
    };
    if (id != null) {
      map[idColum] = id;
    }
    return map;
//    Map < String,dynamic> = map = {};
  }

  @override
  String toString() {
    return "Contact(name: $name, email: $email, telefone: $telefone, img: $img";
  }

}

