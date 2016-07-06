/*global cordova, module*/

module.exports = {
    init: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "FCMPushPlugin", "init", []);
    }
};
