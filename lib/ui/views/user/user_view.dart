import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_viewmodel.dart';

class UserView extends StackedView<UserViewModel> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UserViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  UserViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserViewModel();
}
