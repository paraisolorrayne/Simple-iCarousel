//
//  ViewController.m
//  iCarouselSample
//
//  Created by Marcelo Mendes Pereira on 21/02/17.
//  Copyright © 2017 Zup IT. All rights reserved.
//

#import "ViewController.h"

#import <iCarousel/iCarousel.h>

#import "CarouselCellView.h"

@interface ViewController () <iCarouselDataSource, iCarouselDelegate>

@property (strong, nonatomic) IBOutlet iCarousel *carousel;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.carousel.type = iCarouselTypeCoverFlow2;
    self.carousel.dataSource = self;
    self.carousel.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - iCarouselDataSource

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return 10;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    CarouselCellView *cellView = [CarouselCellView instanceFromXIB];
    cellView.frame = CGRectMake(0, 0, carousel.bounds.size.width*0.8, 200);
    NSString *myStr = @"iCarousel";
    cellView.titleLabel.text = myStr;
    CGFloat r = (arc4random() % 255)/255.0;
    CGFloat g = (arc4random() % 255)/255.0;
    CGFloat b = (arc4random() % 255)/255.0;
    cellView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    return cellView;
}

#pragma mark - iCarouselDelegate


@end
