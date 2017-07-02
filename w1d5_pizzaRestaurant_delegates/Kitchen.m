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
    if (self.delegate && [self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings])
    {
        Pizza *pizza;
        
        if ([self.delegate kitchenShouldUpgradeOrder:self])
        {
            pizza = [[Pizza alloc]initWithSize:large andToppings:toppings];
        }
        else
        {
            pizza = [[Pizza alloc]initWithSize:size andToppings:toppings];
        }
        if ([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)])
        {
            [self.delegate kitchenDidMakePizza:pizza];
            
        }
        return pizza;
    }

    //return [[Pizza alloc] initWithSize:size andToppings:toppings];
    return nil;
}

//[[Kitchen specialPizzas] containsObject:commandWords[0]]

+ (NSArray <NSString*>*)specialPizzas
{
    return nil;
}


@end
