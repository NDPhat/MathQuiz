import '../../driff/db/db_app.dart';

abstract class PlayerLocalRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  PlayerLocalRepo(this.appDb);
  Future<void> insertPlayerLocal(PlayerLocalEntityCompanion entityCompanion);
  Future<void> updatePlayerLocal(PlayerLocalEntityData entityData, int id);
  Future<PlayerLocalEntityData> getPlayerLocal(int id);
  Future<void> deletePlayerLocal(int id);
}
