//
//  HNScratch.h
//  HNScratch
//

#import <Foundation/Foundation.h>
#import "ScratchView.h"

//! Project version number for HNScratch.
FOUNDATION_EXPORT double HNScratchVersionNumber;

//! Project version string for HNScratch.
FOUNDATION_EXPORT const unsigned char HNScratchVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <HNScratch/PublicHeader.h>

@interface HNScratch: NSObject {
    UIImage *scratchImage;
    UIImage *scratchableImage;
    CGFloat lineWidth;
    ScratchView *scratchView;
}

- (id)initWithImagesAndWidth: (UIImage *)backgroundImage scratchImage:(UIImage *)image lineWidth:(CGFloat)width;

- (ScratchView *) getScratch;
@end

