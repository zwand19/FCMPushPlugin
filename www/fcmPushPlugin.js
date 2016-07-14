/*global cordova, module*/

module.exports = {
    init: function (successCallback, errorCallback) {
      cordova.exec(successCallback, errorCallback, "FCMPushPlugin", "init", []);
    },
    log: function (eventName, paramName, paramValue, successCallback, errorCallback) {
      cordova.exec(successCallback, errorCallback, "FCMPushPlugin", "log", [eventName, paramName, paramValue]);
    },
    setUserProperty: function (name, value, successCallback, errorCallback) {
      cordova.exec(successCallback, errorCallback, "FCMPushPlugin", "setUserProperty", [name, value]);
    }
};
