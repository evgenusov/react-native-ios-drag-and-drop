#import "React/RCTViewManager.h"

@interface RCT_EXTERN_MODULE(IosDragAndDropViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(enabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onDrop, RCTBubblingEventBlock)



@end
