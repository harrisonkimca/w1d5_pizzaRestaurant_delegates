//
//  main.m
//  w1d5_pizzaRestaurant_delegates
//
//  Created by Seantastic31 on 02/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "InputCollector.h"
#import "Kitchen.h"
#import "Pizza.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"Welcome to PizzaRestaurant. Please place your order.");
            NSString *inputString = [InputCollector inputForPrompt:@"Pick your pizza size and toppings:\n> "];
            NSLog(@"The order you placed is: %@", inputString);
            
            // take order
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            NSArray *toppings = [commandWords subarrayWithRange:NSMakeRange(1, commandWords.count - 1)];
            
            PizzaSize size;
            Pizza *pizza;
            
            if ([commandWords[0] isEqualToString:@"small"])
            {
                size = small;
                pizza = [restaurantKitchen makePizzaWithSize:size toppings:toppings];
            }
            else if ([commandWords[0] isEqualToString:@"medium"])
            {
                size = medium;
                pizza = [restaurantKitchen makePizzaWithSize:size toppings:toppings];
            }
            else if ([commandWords[0] isEqualToString:@"large"])
            {
                size = large;
                pizza = [restaurantKitchen makePizzaWithSize:size toppings:toppings];
            }
            //else if ([[Kitchen specialPizzas] containsObject:commandWords[0]])
            else if ([commandWords [0] isEqualToString:@"large"] && [toppings isEqualToArray:@[@"pepperoni"]])
            {
                [[Kitchen specialPizzas] containsObject:commandWords[0]];
            }
            
            else if ([toppings isEqualToArray:@[@"meatlovers"]])
            {
                [Kitchen specialPizzas];
            }
            // error handle order taking
            else {
                NSLog(@"Please enter a valid pizza size. Valid sizes are: small, medium, or large");
                continue;
            }
            
            // output order
            
            if (pizza)
            {
                // toppings
                NSMutableString *order = [[NSMutableString alloc]init];
                for (NSString *topping in pizza.toppings)
                {
                    [order appendString:topping];
                    [order appendString:@" "];
                }
                // size
                NSString *size;
                if(pizza.size == 0)
                {
                    size = @"small";
                }
                else if (pizza.size == 1)
                {
                    size = @"medium";
                }
                else if (pizza.size == 2)
                {
                    size = @"large";
                }
                // log order
                NSLog(@"You ordered a %@ pizza with %@", size, order);
            }
            else
                // error handle order output
            {
                NSLog(@"Order not valid");
            }
        }
    }
    return 0;
}
