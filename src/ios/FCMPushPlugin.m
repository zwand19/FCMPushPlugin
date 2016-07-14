#import "FCMPushPlugin.h"

@implementation FCMPushPlugin

- (void)init:(CDVInvokedUrlCommand*)command
{
  NSString* callbackId = [command callbackId];

  UIUserNotificationType allNotificationTypes =
  (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
  UIUserNotificationSettings *settings =
  [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
  [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
  [[UIApplication sharedApplication] registerForRemoteNotifications];

  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
  [self.commandDelegate sendPluginResult:result callbackId:callbackId];
}

- (void)log:(CDVInvokedUrlCommand*)command
{
  NSString* callbackId = [command callbackId];

  NSString* eventName = [[command arguments] objectAtIndex:0];
  NSString* paramName = [[command arguments] objectAtIndex:1];
  NSString* paramValue = [[command arguments] objectAtIndex:2];

  [FIRAnalytics logEventWithName:eventName
                         parameters:@{
                                      paramName: paramValue
                                      }];

  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
  [self.commandDelegate sendPluginResult:result callbackId:callbackId];
}

- (void)setUserProperty:(CDVInvokedUrlCommand*)command
{
  NSString* callbackId = [command callbackId];

  NSString* name = [[command arguments] objectAtIndex:0];
  NSString* value = [[command arguments] objectAtIndex:1];

  [FIRAnalytics setUserPropertyString:name forName:value];

  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
  [self.commandDelegate sendPluginResult:result callbackId:callbackId];
}

@end