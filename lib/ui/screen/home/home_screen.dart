import 'package:demo/service/api_service.dart';
import 'package:demo/service/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final storageService = context.read<StorageService>();
        final apiService = context.read<ApiService>();

        // Create a unique view model for each HomeScreen instance using the
        // shared storage service.
        return HomeViewModel(
          storageService: storageService,
          apiService: apiService,
        );
      },
      builder: (context, _) => _HomeView(context.watch()),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView(this.viewModel, {Key? key}) : super(key: key);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: viewModel.isBusy
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Username: ' + viewModel.user.username),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: viewModel.logout,
                    child: const Text('Logout'),
                  ),
                ],
              ),
      ),
    );
  }
}
