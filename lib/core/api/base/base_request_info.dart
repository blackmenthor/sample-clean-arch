enum BaseApiRequestType { get, getList, post, put, delete }

class BaseApiRequestInfo {
  BaseApiRequestInfo({
    required this.type,
    required this.path,
    this.queryParams,
    this.header,
    this.body,
  });

  final BaseApiRequestType type;
  final String path;
  final Map<String, dynamic>? queryParams;
  final Map<String, dynamic>? header;
  final Map<String, dynamic>? body;

  @override
  String toString() {
    var ret = '';
    ret += '${type.name.toUpperCase()}: $path\n';
    ret += 'Query: $queryParams\n';
    if (header != null) {
      ret += 'Headers $header\n';
    }
    if (body != null) {
      ret += 'Body: $body\n';
    }
    return ret += 'ts: ${DateTime.now().millisecondsSinceEpoch}';
  }
}
