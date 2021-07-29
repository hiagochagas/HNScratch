//
//  ScratchableView.h
//  CGScratch
//


#import <UIKit/UIKit.h>


@interface ScratchableView : UIView {
	float width;
	float height;
	CGPoint	location;
	CGPoint	previousLocation;
	BOOL firstTouch;
	CGImageRef scratchable;
	CGImageRef scratched;
	CGContextRef alphaPixels;
	CGDataProviderRef provider;
    @public
    UIImage *image;
}

- (void) renderLineFromPoint:(CGPoint)start
                     toPoint:(CGPoint)end;

- (id)initWithFrameImageAndWidth:(CGRect)frame backgroundImage:(UIImage *) image lineWidth:(CGFloat) lWidth;

@end
