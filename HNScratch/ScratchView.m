//
//  ScratchView.m
//  CGScratch
//

#import "ScratchView.h"
#import "ScratchableView.h"


@implementation ScratchView



- (id)initWithUIImage:(UIImage *)image {

    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);

    self = [super initWithFrame:frame];

    if (self) {

        UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectZero];
        background.image = image; //Gabi - image setado aqui
        background.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:background];

        [self setClipsToBounds: YES];

        background.translatesAutoresizingMaskIntoConstraints = false;

        [NSLayoutConstraint activateConstraints: @[
            [background.topAnchor constraintEqualToAnchor: self.topAnchor],
            [background.bottomAnchor constraintEqualToAnchor: self.bottomAnchor],
            [background.leadingAnchor constraintEqualToAnchor: self.leadingAnchor],
            [background.trailingAnchor constraintEqualToAnchor: self.trailingAnchor]
        ]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    ScratchableView *scratchableView = [[ScratchableView alloc] initWithFrameImageAndWidth:rect backgroundImage:scratchableImage lineWidth: lineWidth];
    [self addSubview:scratchableView];
}

@end
