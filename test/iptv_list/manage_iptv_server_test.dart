import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iptv_player/iptv_list/manage_iptv_server.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:iptv_player/shared/macos_form_text_field.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_builder/platform.dart';

void main() {
  IptvServer server;

  setUp(() {
    // Set up your server and serverProvider objects or mocks
  });

  group('ManageIptvServerItem', () {
    testWidgets('Should render form fields when created without IPTV server',
        (WidgetTester tester) async {
      await tester.pumpWidget(getWidget(server: null));

      // Verify that name and URL text fields exist
      expect(find.byType(MacOsFormTextField), findsNWidgets(2));
    });

    testWidgets('Should pre-populate form fields when created with IPTV server',
        (WidgetTester tester) async {
      server = IptvServer("name", "url", id: 1);

      await tester.pumpWidget(getWidget(server: server));

      // Verify that name and URL text fields exist and are populated with server details
      expect(find.widgetWithText(MacosTextField, "name"), findsOneWidget);
      expect(find.widgetWithText(MacosTextField, "url"), findsOneWidget);
    });

    testWidgets('Should fill the fields and submit when form is valid',
        (WidgetTester tester) async {
      server = IptvServer("name", "url", id: 1);

      await tester.pumpWidget(getWidget(server: server));

      // Simulate entering text into form fields and submitting form
      await tester.enterText(
          find.widgetWithText(MacosTextField, "name"), "updated name");
      await tester.enterText(
          find.widgetWithText(MacosTextField, "url"), "updated url");
      await tester.tap(find.byKey(const Key('submit_button')));

      // "Pump" the widget tree to process the tap event
      await tester.pumpAndSettle();
    });

    // ...add more tests as needed
  });
}

Widget getWidget({IptvServer? server}) {
  Platform.init(supportedPlatforms: {Platforms.macOS, Platforms.windows});
  return MacosApp(
    home: ManageIptvServerItem(
      iptvServer: server,
    ),
  );
}
