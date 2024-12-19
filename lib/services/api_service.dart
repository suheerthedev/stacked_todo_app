import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_todo_app/app/app.dialogs.dart';
import 'package:stacked_todo_app/app/app.locator.dart';
import 'package:stacked_todo_app/models/api_model.dart';

class ApiService {
  final DialogService _dialogService = locator<DialogService>();
  Future<dynamic> fetchData() async {
    final url =
        Uri.parse('https://softcodix.pythonanywhere.com/api/serviceprovider/');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List responseBody = jsonDecode(response.body);
        return responseBody.map((data) => ApiModel.fromJson(data)).toList();
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
