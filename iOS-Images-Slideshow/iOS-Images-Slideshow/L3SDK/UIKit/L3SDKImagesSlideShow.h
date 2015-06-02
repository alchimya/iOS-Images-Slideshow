//
//  L3SDKSlideShow.h
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 31/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol L3SDKImagesSlideShowDelegate <NSObject>
//it will be raised when an image will be loaded
- (void)L3SDKImagesSlideShow_NextImageAtIndex:(int)index withSender:(id) sender;
- (void)L3SDKImagesSlideShow_Touched;
@end


@interface L3SDKImagesSlideShow : UIImageView
//it represents an array of images name or remote images url that will be shown on the slideshow
@property (nonatomic,strong)NSMutableArray*images;
//timer interval of slideshow (default 5)
@property (nonatomic,assign)int interval;
//returns YES if slideshow is working otherwise returns NO
@property (nonatomic,assign,readonly)BOOL isStarted;
//class delegate
@property (nonatomic,assign) id<L3SDKImagesSlideShowDelegate> delegate;
//it allows to start the slideshow process
-(void)start;
//it allows to pause the slideshow process
-(void)pause;
//it allows to stop the slideshow process
-(void)stop;
//it allows to move to a specific index image
-(void)moveTo:(int)index;
@end
