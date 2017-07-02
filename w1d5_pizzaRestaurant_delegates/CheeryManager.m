//
//  CheeryManager.m
//  w1d5_pizzaRestaurant_delegates
//
//  Created by Seantastic31 on 02/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "CheeryManager.h"

@implementation CheeryManager

- (BOOL)kitchen:(Kitchen*)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray*)toppings
{
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen*)kitchen
{
    return YES;
}



@end
