#import <Cordova/CDV.h>

@interface FCMPushPlugin : CDVPlugin

- (void) init:(CDVInvokedUrlCommand*)command;
- (void) log:(CDVInvokedUrlCommand*)command;
- (void) setUserProperty:(CDVInvokedUrlCommand*)command;

@end