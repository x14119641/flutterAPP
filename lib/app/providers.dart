import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/store/date_store.dart';

final appProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => DateStore()),
];