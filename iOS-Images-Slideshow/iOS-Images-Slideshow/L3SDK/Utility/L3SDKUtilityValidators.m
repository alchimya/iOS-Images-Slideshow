//
//  L3SDKUtilityValidators.m
//  QRPark
//
//  Created by Domenico Vacchiano on 26/04/15.
//  Copyright (c) 2015 LamCube. All rights reserved.
//

#import "L3SDKUtilityValidators.h"

@implementation L3SDKUtilityValidators

+(BOOL)isValidEmail:(NSString*)email{

    @try {
        
        //creates a regex string which includes all email validation
        NSString *emailRegex= @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        //creates predicate with format matching your regex string
        NSPredicate *emailPredicate  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        //returns true if your email address matches the predicate just formed
        return [emailPredicate evaluateWithObject:email];
        
    }
    @catch (NSException *exception) {
        @throw exception;
    }

}
+(BOOL)isValidUrl:(NSString*)url{
    
    @try {
        //creates a regex string which includes all url validation
        NSString *urlRegex=@"http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&amp;=]*)?";
        
        //creates predicate with format matching your regex string
        NSPredicate *urlPredicate  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegex];
        //returns true if your email address matches the predicate just formed
        return [urlPredicate evaluateWithObject:url];
    }
    @catch (NSException *exception) {
        @throw exception;
    }
}

@end
