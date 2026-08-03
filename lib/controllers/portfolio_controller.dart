import 'package:get/get.dart';

class PortfolioController extends GetxController {
  final selectedNavIndex = 0.obs;

  final heroButtonActive = false.obs;
  final aboutExpanded = false.obs;

  final activeSkillIndex = (-1).obs;
  final activeProjectIndex = (-1).obs;
  final activeContactIndex = (-1).obs;

  void selectNav(int index) {
    selectedNavIndex.value = index;
  }

  Future<void> pulseHeroButton() async {
    heroButtonActive.value = true;
    await Future<void>.delayed(const Duration(milliseconds: 220));
    heroButtonActive.value = false;
  }

  void toggleAbout() {
    aboutExpanded.value = !aboutExpanded.value;
  }

  void toggleSkill(int index) {
    activeSkillIndex.value =
    activeSkillIndex.value == index ? -1 : index;
  }

  void toggleProject(int index) {
    activeProjectIndex.value =
    activeProjectIndex.value == index ? -1 : index;
  }

  Future<void> pulseContact(int index) async {
    activeContactIndex.value = index;
    await Future<void>.delayed(const Duration(milliseconds: 220));
    activeContactIndex.value = -1;
  }
}