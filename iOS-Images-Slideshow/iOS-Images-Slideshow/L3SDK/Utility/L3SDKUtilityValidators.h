//
//  L3SDKUtilityValidators.h
//  QRPark
//
//  Created by Domenico Vacchiano on 26/04/15.
//  Copyright (c) 2015 LamCube. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface L3SDKUtilityValidators : NSObject

+(BOOL)isValidEmail:(NSString*)email;
+(BOOL)isValidUrl:(NSString*)url;
@end
