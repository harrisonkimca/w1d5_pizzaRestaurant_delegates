//
//  Pizza.h
//  w1d5_pizzaRestaurant_delegates
//
//  Created by Seantastic31 on 02/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PizzaSize)
{
    small,
    medium,
    large
};

@interface Pizza : NSObject

@property (readonly) PizzaSize size;
@property (strong, readonly) NSArray<NSString*> *toppings;

- (instancetype)initWithSize:(PizzaSize) size andToppings:(NSArray<NSString*>*)toppings;
+ (Pizza*)largePepperoni;
+ (Pizza*)meatLoversWithSize:(PizzaSize)size;

@end
