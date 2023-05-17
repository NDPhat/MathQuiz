import 'package:audioplayers/audioplayers.dart';

int changeDataAfterDoNothing1Turn(int falseQ) {
  return falseQ++;
}
void playSound(String soundName) {
  final _player = AudioPlayer();
  _player.play(AssetSource(soundName));
}

