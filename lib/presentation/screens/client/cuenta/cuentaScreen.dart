import 'package:cutap/config/MenuCuentaCliente/MenuItemeCliente.dart';
import 'package:cutap/presentation/widgets/client/widgets_reutilizables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

class CuentaClienteScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const CuentaClienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: crearAppbar("Cuenta", Icon(Icons.settings)),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItemsCliente.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItemsCliente[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItemCliente menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );
        // Navigator.pushNamed(context, menuItem.link );

        // context.pushNamed( CardsScreen.name );
        context.push(menuItem.link);
      },
    );
  }
}
