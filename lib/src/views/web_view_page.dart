import '../utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String login;
  final String senha;
  const WebViewPage({
    Key? key,
    required this.login,
    required this.senha,
  }) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  Future<void> _logout() async {
    Modular.get<AppPreferences>().removeAll();

    Modular.to.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _logout(),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: WebView(
        initialUrl:
            'https://pub.dev/packages?q=${widget.login}____${widget.senha}',
      ),
    );
  }
}
