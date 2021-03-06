import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_mobile/app/modules/client/client_list_page.dart';
import 'package:flutter_web_mobile/app/modules/client/client_page.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../config/hasura_config.dart';
import '../../repositories/client_repository.dart';
import 'client_controller.dart';

class ClientModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientController()),
        Bind((i) => ClientRepository(i.get<HasuraConnect>())),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientListPage()),
        Router('/list', child: (_, args) => ClientPage()),
      ];

  static Inject get to => Inject<ClientModule>.of();
}
