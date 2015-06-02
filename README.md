# iOS-Images-Slideshow
An images slideshow, based on UIImageView subclass.

# How to use
<h5>properties</h5>

  name                        |     type                    |   description    
------------------------------| ----------------------------|--------------------------------------------------------
images                        | NSMutableArray              | it represents an array of images name or remote images url (eg. google images, panoramio etc.) that will be shown on the slideshow
interval                      | int                         | timer interval of slideshow (default 5)
delegate                      | id                          | class delegate (see L3SDKImagesSlideShowDelegate)
isStarted                     | BOOL                        | returns YES if slideshow is working otherwise returns NO

<h5>methods</h5>
  name                  |     type        |   description    
--------------          | ----------------|-------------------------------------------------------------------
start                   | void            | it allows to start the slideshow proces
pause                   | void            | it allows to pause the slideshow process
stop                    | void            | it allows to stop the slideshow proces
moveTo                  | void            | it allows to move to a specific index image

<h5>protocols</h5>

```objectivec
@protocol L3SDKImagesSlideShowDelegate <NSObject>
//it will be raised when an image will be loaded
- (void)L3SDKImagesSlideShow_NextImageAtIndex:(int)index withSender:(id) sender;
- (void)L3SDKImagesSlideShow_Touched;
@end
```

<h5>examples</h5>
```objectivec

     //load images array with names and links
    self.slideShow.images=[[NSMutableArray alloc] initWithObjects:
                 @"image_1.jpg",
                 @"image_2.jpg",
                 @"image_3.jpg",
                 @"image_4.jpg",
                 @"image_5.jpg",
                 @"http://servername/images/image1.jpg",
                 @"http://servername/images/image2.jpg",
                 @"http://servername/images/image3.jpg",
                 nil];

    //sets slideshow delegate
    self.slideShow.delegate=self;
    
    //sets slideshow time interval
    self.slideShow.interval=3;
    
    //start slideshow
    [self.slideShow start];


```

<br/>
![ScreenShot](https://raw.github.com/alchimya/iOS-Images-Slideshow/master/screenshots/iOS-Images-Slideshow.gif)
