//
//  ScratchableView.m
//  CGScratch
//

#import "ScratchableView.h"


@implementation ScratchableView


- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (id)initWithFrameImageAndWidth:(CGRect)frame backgroundImage:(UIImage *) image lineWidth:(CGFloat) lWidth{
    
    self = [super initWithFrame:frame];
    if (self) {
        UIImage * scaledImage = [self imageWithImage:image scaledToSize:frame.size];

		scratchable = scaledImage.CGImage;

        width = CGImageGetWidth(scratchable);
        height = CGImageGetHeight(scratchable);
		self.opaque = NO;
        
		CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceGray();
		
		CFMutableDataRef pixels = CFDataCreateMutable(kCFAllocatorDefault, width * height );
        CFDataSetLength(pixels, width * height);
        alphaPixels = CGBitmapContextCreate(
                            CFDataGetMutableBytePtr(pixels),
                            width,
                            height,
                            8,
                            width,
                            colorspace,
                            kCGImageAlphaNone
                      );
		provider = CGDataProviderCreateWithCFData(pixels);
		
		
		CGContextSetFillColorWithColor(alphaPixels, [UIColor blackColor].CGColor);
		CGContextFillRect(alphaPixels, frame);
		
		CGContextSetStrokeColorWithColor(alphaPixels, [UIColor whiteColor].CGColor);
        CGContextSetLineWidth(alphaPixels, lWidth);
		CGContextSetLineCap(alphaPixels, kCGLineCapRound);
		
		CGImageRef mask = CGImageMaskCreate(width, height, 8, 8, width, provider, nil, NO);
		scratched = CGImageCreateWithMask(scratchable, mask);
		
		CGImageRelease(mask);
		CGColorSpaceRelease(colorspace);
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
	CGContextDrawImage(UIGraphicsGetCurrentContext() , [self bounds] , scratched);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:self] anyObject];
	firstTouch = YES;
	location = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event touchesForView:self] anyObject];
	
	if (firstTouch) {
		firstTouch = NO;
		previousLocation = [touch previousLocationInView:self];
	} else {
		location = [touch locationInView:self];
		previousLocation = [touch previousLocationInView:self];
	}
	
	// Render the stroke
	[self renderLineFromPoint:previousLocation toPoint:location];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:self] anyObject];
	if (firstTouch) {
		firstTouch = NO;
		previousLocation = [touch previousLocationInView:self];
		
		[self renderLineFromPoint:previousLocation toPoint:location];
	}
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void) renderLineFromPoint:(CGPoint)start toPoint:(CGPoint)end {
	
	CGContextMoveToPoint(alphaPixels, start.x, start.y);
	CGContextAddLineToPoint(alphaPixels, end.x, end.y);
	CGContextStrokePath(alphaPixels);
	[self setNeedsDisplay];
}


@end
