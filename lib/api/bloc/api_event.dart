sealed class ApiEvent {
  final String apiEndPoint;
  final bool needAuthorization;
  final Map<String, String> extraHeader;

  const ApiEvent({
    required this.apiEndPoint,
    this.needAuthorization = true,
    this.extraHeader = const {},
  });
}

final class Get extends ApiEvent {
  final String queryParams;

  const Get(
    String apiEndPoint, {
    this.queryParams = '',
    bool needAuthorization = true,
    Map<String, String> extraHeader = const {},
  }) : super(
          apiEndPoint: apiEndPoint,
          needAuthorization: needAuthorization,
          extraHeader: extraHeader,
        );
}

final class Post extends ApiEvent {
  final Map<String, dynamic> body;

  const Post(
    String apiEndPoint,
    this.body, {
    bool needAuthorization = true,
    Map<String, String> extraHeader = const {},
  }) : super(
          apiEndPoint: apiEndPoint,
          needAuthorization: needAuthorization,
          extraHeader: extraHeader,
        );
}

final class Put extends ApiEvent {
  final String id;
  final Map<String, dynamic> body;

  const Put(
    String apiEndPoint,
    this.id,
    this.body, {
    bool needAuthorization = true,
    Map<String, String> extraHeader = const {},
  }) : super(
          apiEndPoint: apiEndPoint,
          needAuthorization: needAuthorization,
          extraHeader: extraHeader,
        );
}

final class Delete extends ApiEvent {
  final String id;

  const Delete(
    String apiEndPoint,
    this.id, {
    bool needAuthorization = true,
    Map<String, String> extraHeader = const {},
  }) : super(
          apiEndPoint: apiEndPoint,
          needAuthorization: needAuthorization,
          extraHeader: extraHeader,
        );
}
