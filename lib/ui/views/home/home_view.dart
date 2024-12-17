import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_todo_app/ui/common/app_colors.dart';
import 'package:stacked_todo_app/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
              child: ListView.builder(
            itemCount: viewModel.data.length,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text("Title"),
                subtitle: Text("Subtitle"),
                trailing: Icon(Icons.menu),
              );
            },
          )),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
