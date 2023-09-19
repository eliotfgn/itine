import 'package:flutter/material.dart';
import 'package:itine/presentation/widgets/common/navigation_bar.dart';

class RootNavigation extends StatelessWidget {
  const RootNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
