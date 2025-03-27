import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/config/utils/popups.dart';
import 'package:gym_app/presentation/providers/global_message_provider.dart';
import 'package:gym_app/presentation/providers/user/auth_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;
  const HomeScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(authProvider.notifier).login();
  }

@override
  Widget build(BuildContext context) {

    ref.listen(globalMessageProvider, (prev, next){
      if (next.errorMessage.isEmpty) return;
      Popups.showErrorFlush(context, next.errorMessage);
    });


    ref.listen(globalMessageProvider, (prev, next) async{
      if (next.successMessage.isEmpty) return;
      Popups.showToast(context ,next.successMessage);
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: TabBar(
                    onTap: (value) {
                      widget.navigationShell.goBranch(value);
                    },
                    tabs: const [
                      Tab(
                        text: 'Actividades',
                        icon: Icon(Icons.fitness_center_rounded),
                      ),
                      Tab(
                        text: 'Mis Actividades',
                        icon: Icon(Icons.star_border_rounded),
                      ),
                    ]),
              ),
          ),
          body: widget.navigationShell,
      ),
    );
  }
}