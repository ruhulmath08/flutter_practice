import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/src/core/constants/string_constants.dart';
import 'package:flutter_practice/src/core/network/api_service.dart';
import 'package:flutter_practice/src/core/routes/routes.dart';
import 'package:flutter_practice/src/features/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:flutter_practice/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_practice/src/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_practice/src/features/auth/presentation/login_bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController(text: 'emily');
  final _passwordController = TextEditingController(text: 'emilyspass');

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => LoginBloc(
          loginUseCase: LoginUseCase(
            repository: AuthRepositoryImpl(
              authRemoteDataSource: AuthRemoteDataSourceImpl(
                apiService: ApiService(),
              ),
            ),
          ),
        ),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) =>
              previous.loginStateStatus != current.loginStateStatus,
          listener: (context, state) {
            if (state.loginStateStatus == LoginStateStatus.failed) {
              _showSnackBar(context, state.loginFailedMessage);
            }
            if (state.loginStateStatus == LoginStateStatus.success) {
              Navigator.pushReplacementNamed(context, Routes.homePage);
            }
          },
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.1),
                _buildTopImage(),
                SizedBox(height: constraints.maxHeight * 0.1),
                _buildLoginText(context),
                SizedBox(height: constraints.maxHeight * 0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildUsernameField(),
                      _buildPasswordField(),
                      _buildLoginButton(),
                      const SizedBox(height: 16.0),
                      _buildForgotPassword(context),
                      _buildDoNotHaveAnAccount(context),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Text _buildLoginText(BuildContext context) {
    return Text(
      StringConstants.login,
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTopImage() {
    return Image.network(
      "https://i.postimg.cc/nz0YBQcH/Logo-light.png",
      height: 100,
    );
  }

  Widget _buildDoNotHaveAnAccount(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text.rich(
        const TextSpan(
          text: StringConstants.doNotHaveAnAccount,
          children: [
            TextSpan(
              text: " ${StringConstants.signUp}",
              style: TextStyle(
                color: Color(0xFF00BF6D),
              ),
            ),
          ],
        ),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.64),
            ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        StringConstants.forgotPassword,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.64),
            ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextFormField(
          controller: _usernameController,
          decoration: const InputDecoration(
            hintText: StringConstants.username,
            filled: true,
            fillColor: Color(0xFFF5FCF9),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          keyboardType: TextInputType.phone,
          validator: (String? username) {
            return username!.trim().isEmpty
                ? StringConstants.usernameIsRequired
                : null;
          },
          onChanged: (String? username) {
            context.read<LoginBloc>().add(
                  LoginUsernameChanged(username: username),
                );
          },
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: StringConstants.password,
              filled: true,
              fillColor: Color(0xFFF5FCF9),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            validator: (String? password) {
              return password!.trim().isEmpty
                  ? StringConstants.passwordIsRequired
                  : null;
            },
            onChanged: (String? password) {
              context.read<LoginBloc>().add(
                    LoginPasswordChanged(password: password),
                  );
            },
          ),
        );
      },
    );
  }

  Widget _buildLoginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.loginStateStatus != current.loginStateStatus,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context.read<LoginBloc>().add(LoginSubmitted()),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFF00BF6D),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
            disabledBackgroundColor: Colors.grey,
            shape: const StadiumBorder(),
          ),
          child: (state.loginStateStatus == LoginStateStatus.loading)
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Loading please wait ...',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              : const Text("Sign in"),
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
