import 'package:demo/service/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loading_viewmodel.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final storageService = context.read<StorageService>();

        // Create and initialize a view model for the loading screen, but do not
        // pass to child since it is not needed. This could be changed if more
        // than just a loading indicator is to be shown.
        return LoadingViewModel(storageService: storageService);
      },
      builder: (context, child) {
        context.read<LoadingViewModel>().init();
        return child!;
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
