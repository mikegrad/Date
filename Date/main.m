//
//  main.m
//  Date
//
//  Created by Michael Gradilone on 10/3/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Date.h"
#import "DateView.h"

#import "DateAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
 
        
        //Call the init method that takes no arguments.
		Date *today = [[Date alloc] initWithMonth:1 day:1 year:2013];
        //Date *today = [[Date alloc] init];
        
		//Two ways to do the same thing.  description returns an NSString.
		NSLog(@"Today is %@.", [today description]);
		NSLog(@"Today is %@.\n\n", today);
        
		NSLog(@"Today is day number %d out of %d in month number %d.",
              [today day],			//Call a method that is a getter.
              [today monthLength],	//Call a method that is not a getter.
              [today month]			//Call a method that is a getter.
              );
        
		//Two ways to do the same thing: call a getter.
		//NSLog(@"Today is day number %d of the month.", [today day]);
		NSLog(@"Today is day number %d of the month.\n\n", today.day);
        
		//Two ways to do the same thing: call a setter.
		//[today setDay: 1];
		today.day = 1;
        
		[today next];			//Move the object 1 day forward.
		NSLog(@"The next day of this date is %@.", today);
        
        
        [today prev:2];			//Move the object 1 day forward.
		NSLog(@"The previous day of this date is %@.", today);
        
		//Call the init method that takes three arguments.
		Date *independenceDay =
        [[Date alloc] initWithMonth: 7 day: 4 year: 1776
         ];
        
        independenceDay.reminder = @"Fireworks tonight";
        
		NSLog(@"Independence Day was %@.", independenceDay);
		[independenceDay next: [independenceDay monthLength]];
		NSLog(@"America was one month old on %@.", independenceDay);

        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([DateAppDelegate class]));
    }
}
