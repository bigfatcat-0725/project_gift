import 'package:get/get.dart';
import 'package:hive/hive.dart';

RxList diary = [].obs;

class DiaryController extends GetxController {
  dynamic diaryBox;

  @override
  void onInit() async {
    diaryBox = await Hive.openBox('diary_box');
    // diaryBox.clear();
    read();
    super.onInit();
  }

  void read() {
    if (diaryBox.get('list') == null) {
      diaryBox.put('list', []);
    } else {
      diary.value = diaryBox.get('list');
    }
    print(diary);
  }

  void write(String date, String content) {
    List data = diary;
    data.add({'date': date, 'content': content});
    diaryBox.put('list', [...data]);
  }

  void repair(String date, String content, int index) {
    List data = diary;
    final replacements = {'date': date, 'content': content};
    data.removeAt(index);
    data.insert(index, replacements);
    diaryBox.put('list', [...data]);
  }

  void delete(int index) {
    List data = diary;
    data.removeAt(index);
    diaryBox.put('list', [...data]);
  }
}
