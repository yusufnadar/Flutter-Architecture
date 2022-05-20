// ignore: constant_identifier_names
const baseUrl = 'https://yusufnadar.com/api';
class EndPoints {
  static const todos = 'todos';
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const getUser = '/user/get';
}

class Status {
  static const success = 200;
  static const created = 201;
  static const accepted = 202;
  static const notAuthoritativeInformation = 203;
  static const redirect = 300;
  static const badRequest = 400;
  static const unAuthorized = 401;
  static const forbidden = 403;
  static const notFound = 404;
  static const validationError = 422;
  static const gatewayTimeout = 504;
}
