class Validation{
  bool email(String value) {
    var email = value.split('@');
    if (email.length != 2) {
      return false;
    } else {
      var name = email[0].trim();
      if (name == '') {
        return false;
      } else {
        var host = email[1].trim();
        if (host == '') {
          return false;
        } else {
          if (!host.contains('.')) {
            return false;
          }
        }
      }
    }
    return true;
  }
}