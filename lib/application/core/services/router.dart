import 'package:go_router/go_router.dart';
import 'package:project_ktp/application/pages/add_page.dart';
import 'package:project_ktp/application/pages/detail_page.dart';
import 'package:project_ktp/application/pages/edit_page.dart';
import 'package:project_ktp/application/pages/list_page.dart';
import 'package:project_ktp/data/local/local_storage.dart';

class RouterPage {
  final GoRouter _route = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => Dashboard()),
    GoRoute(path: '/add', builder: (context, state) => AddPage()),
    GoRoute(
        path: '/detail',
        builder: (context, state) {
          final data = state.extra as DataStorage;
          return DetailPage(data: data);
        }),
    GoRoute(
        path: '/edit',
        builder: (context, state) {
          final data = state.extra as DataStorage;
          return EditPage(data: data);
        })
  ]);
  getRouterPage() {
    return _route;
  }
}
