import 'package:coreinvent/di/app_di.dart';
import 'package:coreinvent/ui/screens/home/bloc/home_bloc.dart';
import 'package:coreinvent/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(serviceLocator())..add(const TokenFetched()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status.isSuccess) {
              return Center(child: Text(state.token));
            } else {
              return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
