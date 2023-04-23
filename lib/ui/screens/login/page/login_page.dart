import 'package:coreinvent/di/app_di.dart';
import 'package:coreinvent/routes.dart';
import 'package:coreinvent/ui/screens/login/bloc/login_bloc.dart';
import 'package:coreinvent/ui/widgets/custom_text_form_field.dart';
import 'package:coreinvent/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(serviceLocator()),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if(state.status.isSuccess) {
              context.pushReplacement(RoutePath.home());
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state.status.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status.isError) {
                return const LoginLayout(error: true);
              } else {
                return const LoginLayout();
              }
            },
          ),
        ),
      ),
    );
  }
}

class LoginLayout extends StatelessWidget {
  const LoginLayout({
    super.key,
    this.error = false,
  });

  final bool error;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¡Hola!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              'Utiliza tus credenciales de usuario para acceder al sistema',
              style: TextStyle(fontSize: 14),
            ),
            const _Language(),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: 'correo electrónico',
              error: error,
              onChanged: (value) {
                context.read<LoginBloc>().add(LoginEmailChanged(value));
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'contraseña',
              error: error,
              onChanged: (value) {
                context.read<LoginBloc>().add(LoginPasswordChanged(value));
              },
            ),
            if (error) ...[
              const SizedBox(height: 10),
              const Text(
                'credenciales de usuario incorrectas',
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
            ],
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                '¿Has olvidado tu contraseña?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const Text(
              'Si no desipones de una cuenta de usuario o tienes problemas para acceder, ponte en contacto con tu administrador',
              style: TextStyle(fontSize: 10),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent),
                onPressed: () {
                  context.read<LoginBloc>().add(const AuthenticationChanged());
                },
                child: const Text(
                  'Acceder',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Language extends StatelessWidget {
  const _Language({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.language_outlined),
        const SizedBox(width: 10),
        const Text('Español'),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Cambiar',
          ),
        ),
      ],
    );
  }
}
