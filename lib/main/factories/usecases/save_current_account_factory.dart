import 'package:for_dev/main/factories/cache/cache.dart';

import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

SaveCurrentAccount makeLocalSaveCurrentAccount() => LocalSaveCurrentAccount(
      saveSecureCachedStorage: makeLocalStorageAdapter(),
    );
