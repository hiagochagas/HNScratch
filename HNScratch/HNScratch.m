//
//  HNScratch.m
//  objC
//

#import "HNScratch.h"
#import "ScratchView.h"

@implementation HNScratch

- (id)initWithImagesAndWidth: (UIImage *)backgroundImage scratchImage:(UIImage *)image lineWidth:(CGFloat)width {
    scratchImage = backgroundImage;
    scratchableImage = image;
    lineWidth = width;
    
    scratchView = [ScratchView.new initWithUIImage: scratchImage];
    scratchView->scratchableImage = scratchableImage;
    scratchView->lineWidth = lineWidth;
    return self;
}

- (ScratchView *) getScratch {
    return scratchView;
}

@end
