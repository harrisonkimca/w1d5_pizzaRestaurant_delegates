//
//  Kitchen.m
//  w1d5_pizzaRestaurant_delegates
//
//  Created by Seantastic31 on 02/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings
{
    return [[Pizza alloc] initWithSize:size andToppings:toppings];
}

//[[Kitchen specialPizzas] containsObject:commandWords[0]]

+ (NSArray <NSString*>*)specialPizzas
{
    return nil;
}


@end
