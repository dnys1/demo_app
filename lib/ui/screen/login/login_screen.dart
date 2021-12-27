import 'package:demo/service/api_service.dart';
import 'package:demo/service/storage_service.dart';
import 'package:demo/ui/screen/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final storageService = context.read<StorageService>();
        final apiService = context.read<ApiService>();

        // Create a unique view model for each LoginScreen instance using the
        // shared storage and API services.
        return LoginViewModel(
          storageService: storageService,
          apiService: apiService,
        );
      },
      builder: (context, _) => _LoginView(context.watch()),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: viewModel.usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: viewModel.passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: viewModel.login,
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
