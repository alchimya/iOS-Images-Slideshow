//
//  L3SDKSlideShow.m
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 31/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKImagesSlideShow.h"
#import "L3SDKUtilityValidators.h"

@interface L3SDKImagesSlideShow ()
@property (nonatomic,assign)int currentIndex;
@property (nonatomic,strong) NSTimer*timer;
-(void)tick:(NSTimer*)timer;
-(void)initDefaults;
-(void)showImageAtIndex:(int)index;
-(void)resetTimer;
@end

@implementation L3SDKImagesSlideShow
@synthesize images;
@synthesize interval;
@synthesize delegate;

#pragma mark Init Facroty Methods
-(id)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        [self initDefaults];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initDefaults];
    }
    return self;
}

/*
-(void)setImages:(NSArray *)imgs{
    images=imgs;
    self.currentIndex=0;
    [self stop];
    [self start];
}
 */

#pragma mark Public Methods and Actions

-(void)start{
    
    
    if ([self.images count]==0) {
        return;
    }
    //chedules a timer on tick void
    self.timer= [NSTimer scheduledTimerWithTimeInterval: self.interval
                                                 target: self
                                               selector:@selector(tick:)
                                               userInfo: nil repeats:YES];
    [self.timer fire];
}
-(void)stop{
    self.currentIndex=0;
    [self resetTimer];
}
-(void)pause{
    [self resetTimer];
}
-(void)moveTo:(int)index{
    if ([self.images count]==0) {
        return;
    }
    if (index <=[self.images count]-1) {
        self.currentIndex=index;
        [self showImageAtIndex:index];
    }
}
#pragma mark Private Methods
-(void)initDefaults{
    self.currentIndex=0;
    self.interval=5;
}

-(void)resetTimer{
    [self.timer invalidate];
    self.timer=nil;
}
-(void)tick:(NSTimer*)timer{
    if (self.currentIndex==[self.images count]) {
        self.currentIndex=0;
    }
    [self showImageAtIndex:self.currentIndex];
    self.currentIndex++;
}
-(void)showImageAtIndex:(int)index{
    
    NSString *imagePath = [self.images objectAtIndex:self.currentIndex];
    
    
     //if image name is url set image from remote data
     if ([L3SDKUtilityValidators isValidUrl:imagePath]) {
         NSData *data = [NSData dataWithContentsOfURL:
                            [NSURL URLWithString:imagePath]
                         ];
         self.image = [[UIImage alloc] initWithData:data];
         
     } else {
         self.image=[UIImage imageNamed:imagePath];
     }
    
    //send event
    if (self.delegate != NULL && [delegate respondsToSelector:@selector(L3SDKImagesSlideShow_NextImageAtIndex:withSender:)]) {
        [self.delegate L3SDKImagesSlideShow_NextImageAtIndex:self.currentIndex withSender:self];
    }
    
}
@end
