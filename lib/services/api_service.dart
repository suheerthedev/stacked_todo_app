import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_todo_app/app/app.dialogs.dart';
import 'package:stacked_todo_app/app/app.locator.dart';

class ApiService {
  final DialogService _dialogService = locator<DialogService>();
  Future<void> fetchData() async {
    final url =
        Uri.parse('https://softcodix.pythonanywhere.com/api/serviceprovider/');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print(responseBody);
      } else {
        _dialogService.showCustomDialog(
            variant: DialogType.infoAlert,
            title: "Failed to load data :(",
            description: response.statusCode.toString());
      }
    } catch (error) {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Failed to fetch data",
          description: "Error: $error");
    }
  }
}
