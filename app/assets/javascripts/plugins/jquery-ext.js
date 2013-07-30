jQuery.isBlank = function (arg) {
    var testsBlank = false;

    try {
        arg.toString();
        if (arg.toString() == 'undefined') {
            return true;
        }
    } catch(err) {
      return true;
    }

    testsBlank = ((arg == '') || (arg == null) || (arg === null) || (typeof(arg) === 'undefined'));

    return testsBlank;
}
