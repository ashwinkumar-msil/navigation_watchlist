class NoInternetException {
  var msg;
  NoInternetException(this.msg);
}

class NoServiceFoundException {
  var msg;
  NoServiceFoundException(this.msg);
}

class InvalidformatException {
  var msg;
  InvalidformatException(this.msg);
}

class UnknownException {
  var msg;
  UnknownException(this.msg);
}

class FetchDataException {
  FetchDataException(String s);
}

class UnauthorisedException {
  UnauthorisedException(String string);
}

class BadRequestException {
  BadRequestException(String string);
}
