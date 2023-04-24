import 'package:get/state_manager.dart';
import 'package:sysmanagment/app/data/models/meses.dart';
import 'package:sysmanagment/app/data/models/users.dart';

class AppController extends GetxController {
  UserModel? user = null;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  RxInt _currentMonthId = DateTime.now().month.obs;
  List<Month> get meses => <Month>[
        Month.JANUARY,
        Month.FEBRUARY,
        Month.MARCH,
        Month.APRIL,
        Month.MAY,
        Month.JUNE,
        Month.JULY,
        Month.AUGUST,
        Month.SEPTEMBER,
        Month.OCTOBER,
        Month.NOVEMBER,
        Month.DECEMBER,
      ];

  Month get curentMountId => meses[_currentMonthId.value];
  void changeMonth(Month mouth) {
    _currentMonthId.value = mouth.index;
  }
}
