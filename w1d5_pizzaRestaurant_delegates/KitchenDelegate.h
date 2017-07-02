//
//  KitchenDelegate.h
//  w1d5_pizzaRestaurant_delegates
//
//  Created by Seantastic31 on 02/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#ifndef KitchenDelegate_h
#define KitchenDelegate_h

#import <Foundation/Foundation.h>
#import "Pizza.h"

@class Pizza, Kitchen;

@protocol KitchenDelegate <NSObject>
- (BOOL)kitchen:(Kitchen*)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray*)toppings;
- (BOOL)kitchenShouldUpgradeOrder:(Kitchen*)kitchen;

@optional
- (void)kitchenDidMakePizza:(Pizza*)pizza;

@end

#endif /* KitchenDelegate_h */
