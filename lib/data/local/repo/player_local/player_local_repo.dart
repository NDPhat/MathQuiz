import '../../driff/db/db_app.dart';

abstract class PlayerLocalRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  PlayerLocalRepo(this.appDb);
  Future<int> insertPlayerLocal(PlayerLocalEntityCompanion entityCompanion);
  Future<void> updatePlayerLocal(PlayerLocalEntityCompanion entityData, int id);
  Future<PlayerLocalEntityData> getPlayerLocal(int id);
  Future<void> deletePlayerLocal(int id);
}
