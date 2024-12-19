import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_todo_app/app/app.dialogs.dart';
import 'package:stacked_todo_app/app/app.locator.dart';
import 'package:stacked_todo_app/models/api_model.dart';
import 'package:stacked_todo_app/services/api_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();

  List<ApiModel> data = [];
  List<ApiModel> get dataList => data;

  Future<void> fetch() async {
    setBusy(true);
    try {
      final fetchedData = await _apiService.fetchData();
      if (fetchedData is List<ApiModel>) {
        data = fetchedData;
        print(data);
      }
    } catch (error) {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: "Failed",
        description: "Error: $error",
      );
    }
  }
}
