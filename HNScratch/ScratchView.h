//
//  ScratchView.h
//  CGScratch
//

#import <UIKit/UIKit.h>


@interface ScratchView : UIView {
@public
    UIImage *scratchableImage;
    CGFloat lineWidth;
}

- (id)initWithUIImage:(UIImage *)image;

@end
