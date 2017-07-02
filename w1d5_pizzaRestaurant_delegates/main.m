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
#import "Manager.h"
#import "CheeryManager.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        Kitchen *restaurantKitchen = [Kitchen new];
        // replace with singletons
        //Manager *manager = [Manager new];
        //CheeryManager *cheerymanager = [CheeryManager new];
        
        BOOL runLoop = YES;
        
        //while (TRUE) {
        while (runLoop) {
            // Loop forever
            
            // select manager section
            NSString *managerChoice = [InputCollector inputForPrompt:@"Please select a number\n1. Manager\n2. Cheery Manager\n3. No Manager\n4. Quit\n"];
            NSLog(@"You selected %@ for your manager", managerChoice);
            
            BOOL selectPizza = NO;
            
            if ([managerChoice isEqualToString:@"4"])
            {
                NSLog(@"See you next time!");
                break;
            }
            else if ([managerChoice isEqualToString:@"1"])
            {
                // use singleton
                Manager *manager = [Manager sharedInstance];
                restaurantKitchen.delegate = manager;
                selectPizza = YES;
            }
            else if ([managerChoice isEqualToString:@"2"])
            {
                // use singleton
                CheeryManager *cheerymanager = [CheeryManager sharedInstance];
                restaurantKitchen.delegate = cheerymanager;
                selectPizza = YES;
            }
            else if ([managerChoice isEqualToString:@"3"])
            {
                NSLog(@"You will not be using a manager this time");
                restaurantKitchen.delegate = nil;
                selectPizza = YES;
            }
            // select pizza section
            if (selectPizza)
            {
                NSLog(@"Welcome to PizzaRestaurant. Please place your order");
                NSString *inputString = [InputCollector inputForPrompt:@"Pick your pizza size and toppings:\n>"];
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
                    NSLog(@"Order selection not valid, please try again");
                }
            }
            else
            {
                NSLog(@"Manager selection not valid, please try again");
            }
        }
    }
    return 0;
}
