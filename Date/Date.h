//
//  Date.h
//  Date
//
//  Created by Michael Gradilone on 10/3/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <limits.h>

@interface Date: NSObject {
	int year;
	int month;	//1 to 12 inclusive
	int day;	//1 to [self monthLength] inclusive
}

- (id) initWithMonth: (int) m day: (int) d year: (int) y;
- (int) monthLength;    //Return the number of days in the Date's month.

//These three methods are "getters".
//- (int) year;
@property (nonatomic, assign) int year;
@property (nonatomic, strong) NSString *reminder;


- (int) month;
- (int) day;

//These three methods are "setters".
- (void) setYear: (int) y;
- (void) setMonth: (int) m;
- (void) setDay: (int) d;

- (void) next;			//Advance the Date one day into the future.
- (void) next: (int) distance;	//Advance the Date many days into the future.

- (void) prev;			//move back the Date one day .
- (void) prev: (int) distance;	//move the Date many days into the past.

+ (int) yearLength;		//Return the number of months in a year.

@end
