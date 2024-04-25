import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:swapit/features/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: const Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
