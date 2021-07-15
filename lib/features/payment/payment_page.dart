import 'package:flutter/material.dart';
import 'package:movies/core/widgets/navigation_bar/navigation_bar.dart';

class PaymentPage extends StatelessWidget {
  final String title = 'Payment';

  @override
  Widget build(BuildContext context) {
    return _buildNavigationBar().setupContent(
        child: Align(
          child: Text(title),
        )
    );
  }

  NavigationBar _buildNavigationBar() {
    return NavigationBar(
      title: title,
    );
  }
}