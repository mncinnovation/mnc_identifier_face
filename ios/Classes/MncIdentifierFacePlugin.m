#import "MncIdentifierFacePlugin.h"
#if __has_include(<mnc_identifier_face/mnc_identifier_face-Swift.h>)
#import <mnc_identifier_face/mnc_identifier_face-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mnc_identifier_face-Swift.h"
#endif

@implementation MncIdentifierFacePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMncIdentifierFacePlugin registerWithRegistrar:registrar];
}
@end
