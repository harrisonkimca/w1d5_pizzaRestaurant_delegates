//
//  Pizza.m
//  w1d5_pizzaRestaurant_delegates
//
//  Created by Seantastic31 on 02/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Pizza.h"


@implementation Pizza

- (instancetype)initWithSize:(PizzaSize)size andToppings:(NSArray<NSString *> *)toppings
{
    self = [super init];
    if (self) {
        _size = size;
        _toppings = toppings;
    }
    return self;
}

+ (Pizza*)largePepperoni
{
    return [[Pizza alloc]initWithSize:large andToppings:@[@"pepperoni"]];
}

+ (Pizza*)meatLoversWithSize:(PizzaSize)size
{
    return [[Pizza alloc]initWithSize:size andToppings:@[@"pepperoni, ham, chorizo, bacon"]];
}

@end
