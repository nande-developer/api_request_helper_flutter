/// Abstract interface for token management
///
/// Implement this interface to provide authentication tokens to the API client.
/// The implementation should handle token storage, retrieval, and refresh
/// logic.
///
/// Example implementation with Hive:
/// ```dart
/// class HiveTokenProvider implements TokenProvider {
///   @override
///   Future<String?> getToken() async {
///     final box = await Hive.openBox<String>('auth');
///     return box.get('token');
///   }
///
///   @override
///   Future<void> saveToken(String token) async {
///     final box = await Hive.openBox<String>('auth');
///     await box.put('token', token);
///   }
///
///   @override
///   Future<void> clearToken() async {
///     final box = await Hive.openBox<String>('auth');
///     await box.delete('token');
///   }
///
///   @override
///   Future<String?> refreshToken() async {
///     // Implement your token refresh logic
///     final newToken = await _api.refreshToken();
///     await saveToken(newToken);
///     return newToken;
///   }
///
///   @override
///   Future<bool> hasValidToken() async {
///     final token = await getToken();
///     if (token == null) return false;
///
///     // Check if token is expired
///     final jwt = parseJwt(token);
///     final exp = jwt['exp'] as int?;
///     if (exp == null) return false;
///
///     final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
///     return expiryDate.isAfter(DateTime.now());
///   }
/// }
/// ```
abstract interface class TokenProvider {
  /// Retrieves the current authentication token
  ///
  /// Returns `null` if no token is available
  Future<String?> getToken();

  /// Saves a new authentication token
  ///
  /// This method is called when a new token is obtained (e.g., after login)
  Future<void> saveToken(String token);

  /// Clears the stored authentication token
  ///
  /// This method is typically called during logout
  Future<void> clearToken();

  /// Refreshes the authentication token
  ///
  /// Should implement the logic to obtain a new token using a refresh token
  /// or other refresh mechanism. Returns the new token or `null` if refresh
  /// fails.
  Future<String?> refreshToken();

  /// Checks if a valid token is available
  ///
  /// Should verify not just the presence of a token, but also its validity
  /// (e.g., not expired). Returns `true` if a valid token exists.
  Future<bool> hasValidToken();
}

/// No-op token provider for APIs that don't require authentication
class NoAuthTokenProvider implements TokenProvider {
  @override
  Future<String?> getToken() async => null;

  @override
  Future<void> saveToken(String token) async {}

  @override
  Future<void> clearToken() async {}

  @override
  Future<String?> refreshToken() async => null;

  @override
  Future<bool> hasValidToken() async => false;
}
