//
//  ViewController.m
//  iOS-Images-Slideshow
//
//  Created by Domenico Vacchiano on 01/06/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)IBOutlet L3SDKImagesSlideShow*slideShow;
@property (nonatomic,weak)IBOutlet UILabel*imageTitle;
@property (nonatomic,weak) IBOutlet UILabel*counter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //load images array with names and links
    self.slideShow.images=[[NSMutableArray alloc] initWithObjects:
                 @"london_1.jpg",
                 @"london_2.jpg",
                 @"manhattan_1.jpg",
                 @"manhattan_2.jpg",
                 @"manhattan_3.jpg",
                 @"http://whygo-eur.s3.amazonaws.com/www.italylogue.com/files/2008/10/20things_colosseum.jpg",
                 @"http://cache.graphicslib.viator.com/graphicslib/thumbs674x446/5034/SITours/5-day-best-of-italy-trip-in-rome-131307.jpg",
                 @"http://drupal.in-cdn.net/cdn/article/public/moving_to_italy.jpg",
                 nil];

    //sets slideshow delegate
    self.slideShow.delegate=self;
    
    //sets slideshow time interval
    self.slideShow.interval=3;
    
    //start slideshow
    [self.slideShow start];
    
}


#pragma mark Slideshow actions
-(IBAction)start:(id)sender{
    [self.slideShow start];
}
-(IBAction)stop:(id)sender{
    [self.slideShow stop];
}
-(IBAction)pause:(id)sender{
    [self.slideShow pause];
}
-(IBAction)first:(id)sender{
    [self.slideShow moveTo:0];
}
-(IBAction)last:(id)sender{
    [self.slideShow moveTo:(int)[self.slideShow.images count]-1];
}
#pragma mark L3SDKImagesSlideShowDelegate
- (void)L3SDKImagesSlideShow_NextImageAtIndex:(int)index withSender:(id) sender{
   // NSLog(@"%@",[self.images objectAtIndex:index]);
    self.imageTitle.text=[self.slideShow.images objectAtIndex:index];
    self.counter.text=[NSString stringWithFormat:@"%d/%lu",index+1,(unsigned long)[self.slideShow.images count]];
}
- (void)L3SDKImagesSlideShow_Touched{
    NSLog(@"TOUCHED");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
