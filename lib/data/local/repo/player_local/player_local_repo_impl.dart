import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/player_local/player_local_repo.dart';

class PlayerLocalRepoImpl extends PlayerLocalRepo {
  PlayerLocalRepoImpl(super.appDb);

  @override
  Future<void> deletePlayerLocal(int id) async {
    await (appDb.delete(appDb.playerLocalEntity)..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Future<PlayerLocalEntityData> getPlayerLocal(int id) async{
    return await (appDb.select(appDb.playerLocalEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  @override
  Future<int> insertPlayerLocal(
      PlayerLocalEntityCompanion entityCompanion) async {
    return await appDb.into(appDb.playerLocalEntity).insert(entityCompanion);
  }

  @override
  Future<void> updatePlayerLocal(
      PlayerLocalEntityCompanion entityData, int id) async {
    await (appDb.update(appDb.playerLocalEntity)..where((tbl) => tbl.id.equals(id)))
        .write(PlayerLocalEntityCompanion(
      score: entityData.score , participate:  entityData.participate
    ));
  }
}
