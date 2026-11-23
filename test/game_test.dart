import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_turkiye_haritasi_yapbozu/oyun_turkiye_haritasi_yapbozu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(turkiyeHaritasiConfig.title.length, 33);
    expect(turkiyeHaritasiConfig.tagline.length, 33);
    for (final s in turkiyeHaritasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(turkiyeHaritasiConfig.gameId, turkiyeHaritasiId);
    expect(turkiyeHaritasiRules.gameId, turkiyeHaritasiId);
    expect(turkiyeHaritasiConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(turkiyeHaritasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: turkiyeHaritasiId, optionalMechanics: turkiyeHaritasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(turkiyeHaritasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
