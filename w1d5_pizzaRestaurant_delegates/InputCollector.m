//
//  InputCollector.m
//  w1d5_pizzaRestaurant_delegates
//
//  Created by Seantastic31 on 02/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

+ (NSString*)inputForPrompt:(NSString *)promptString
{
    char userChar[255];
    NSLog(@"%@", promptString);
    fgets(userChar, 255, stdin);
    NSString *inputString = [NSString stringWithCString:userChar encoding:NSUTF8StringEncoding];
    NSString *trimmedString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

@end
