import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MacosScaffold(
          toolBar: const ToolBar(
            title: Text('Home'),
          ),
          children: [
            ContentArea(
              builder: (context, scrollController) {
                return const Center(
                  child: Text('Home'),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
