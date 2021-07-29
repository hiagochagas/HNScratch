//
//  ViewController.m
//  HNScratchObjectiveC
//
//  Created by Hiago Chagas on 29/07/21.
//

#import "ViewController.h"
#import "HNScratch.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 20.0;
    HNScratch *scratch1 = [HNScratch.new initWithImagesAndWidth:[UIImage imageNamed:@"background.jpg"]  scratchImage:[UIImage imageNamed:@"scratchable.jpg"] lineWidth: width];
    ScratchView *scratchView = [scratch1 getScratch];
    scratchView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: scratchView];
    [scratchView.widthAnchor constraintEqualToConstant:250].active = YES;
    [scratchView.heightAnchor constraintEqualToConstant:250].active = YES;
    [scratchView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor ].active = YES;
    [scratchView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor ].active = YES;
}


@end
