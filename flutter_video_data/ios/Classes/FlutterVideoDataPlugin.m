#import "FlutterVideoDataPlugin.h"
#import <flutter_video_data/flutter_video_data-Swift.h>

@implementation FlutterVideoDataPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterVideoDataPlugin registerWithRegistrar:registrar];
}
@end
