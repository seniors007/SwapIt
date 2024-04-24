import 'package:flutter/material.dart';
import 'package:swapit/features/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterViewBody(),
    );
  }
}
