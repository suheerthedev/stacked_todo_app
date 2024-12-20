import 'package:stacked_todo_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stacked_todo_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked_todo_app/ui/views/home/home_view.dart';
import 'package:stacked_todo_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_todo_app/services/api_service.dart';
import 'package:stacked_todo_app/ui/views/user/user_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: UserView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
