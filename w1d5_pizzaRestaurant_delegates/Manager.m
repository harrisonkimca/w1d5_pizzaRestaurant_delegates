//
//  Manager.m
//  w1d5_pizzaRestaurant_delegates
//
//  Created by Seantastic31 on 02/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Manager.h"

@implementation Manager

// singleton method
+ (Manager*)sharedInstance
{
    static Manager *_sharedInstance = nil;
    static dispatch_once_t oncePrediate;
    dispatch_once(&oncePrediate, ^{
        _sharedInstance = [[Manager alloc]init];
    });
    return _sharedInstance;
}

- (BOOL)kitchen:(Kitchen*)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray*)toppings
{
    for (NSString *topping in toppings)
    {
        if ([topping isEqualToString:@"anchovies"])
        {
            return NO;
        }
    }
    return YES;
}
    
- (BOOL)kitchenShouldUpgradeOrder:(Kitchen*)kitchen
{
    return NO;
}



@end
