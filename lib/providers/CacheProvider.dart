import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class CacheProvider extends BaseCacheManager {
static const key = "customCache";

static CacheProvider _instance;

factory CacheProvider() {
  if (_instance == null) {
    _instance = new CacheProvider._();
  }
  return _instance;
}

CacheProvider._() : super(key,
maxAgeCacheObject: Duration(days: 7),
maxNrOfCacheObjects: 200);

Future<String> getFilePath() async {
  var directory = await getTemporaryDirectory();
  return p.join(directory.path, key);
}
}