class NameHelper {
  static String currentName(items, {isVariantGroup = false}) {
    var code = 1;
    var name = '';
    for (var i in items) {
      if (i.languageID == code) {
        if (isVariantGroup) {
          name = i.fullName;
        } else {
          name = i.localName;
        }
        break;
      }
    }
    return name;
  }
}