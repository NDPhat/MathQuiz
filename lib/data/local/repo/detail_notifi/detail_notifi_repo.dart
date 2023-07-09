import '../../driff/db/db_app.dart';

abstract class DetailNotifiLocalRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  DetailNotifiLocalRepo(this.appDb);
  Future<void> insertDetailNotifiLocal(
      DetailNotifiEntityCompanion entityCompanion);
  Future<void> updateDetailNotifiLocal(
      DetailNotifiEntityData entityData, int id);
  Future<DetailNotifiEntityCompanion> getDetailNotifiLocal(int id);
  Future<void> deleteDetailNotifiLocal(int id);
}
