import 'package:audioplayers/audioplayers.dart';

void playSoundLocal(AudioPlayer _player, String soundName, double volumeApp) {
  _player.play(AssetSource(soundName), volume: volumeApp);
}
