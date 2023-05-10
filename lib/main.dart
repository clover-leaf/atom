import 'package:atom/app/app.dart';
import 'package:atom/bootstrap.dart';
import 'package:atom/packages/supabase_client/supabase_client.dart';
import 'package:flutter/material.dart';

import 'packages/user_repository/user_repository.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await bootstrap(() {
    const url = 'https://wxewqtcnxxcrtiruydky.supabase.co';
    const key =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind4ZXdxdGNueHhjcnRpcnV5ZGt5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4MzIwMTUzMywiZXhwIjoxOTk4Nzc3NTMzfQ.RHmLq5dWkPSLnC5O7FZ-xcF1Y14mmX5qjCj2j4NBHic';
    final databaseClient = DatabaseClient(url: url, key: key);
    final userRepository = UserRepository(databaseClient: databaseClient);
    return App(userRepository: userRepository);
  });
}
