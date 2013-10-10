//
//  Date.m
//  Date
//
//  Created by Michael Gradilone on 10/3/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import "Date.h"

@implementation Date

@synthesize reminder;

-(id)initWithMonth:(int)m day:(int)d year:(int)y
{
    
    // custom init method
    self = [super init];
    if (self)   {
        
        //
        //year = y;
        //month = m;
        //day = d;
        
        //use the properties now
        self.month = m ;
        self.year = y;
        self.day = d;
        
        reminder = @"";
    }
    
    
    
    return self;
}

//standard init - with todays date. some crazy code just to get todays date

-(id) init
{
    
    self = [super init];
    
    if (self) {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSDate *today = [[NSDate alloc] init];
        
        NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
        
        NSDateComponents *components = [calendar components:unitFlags fromDate:today];
        
        day = components.day;
        year = components.year;
        month = components.month;
        
        reminder = @"";
    }
    
    

    
    return self;
    
    
}

-(NSString *) description
{
    
    return [NSString stringWithFormat:@"%0d / %0d / %d", self.month, self.day, self.year];
    
}


// ge the actual number of days in th emonth , 28,29,30, or 31 are only valid values

-(int) monthLength
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc ]init ];
    
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[calendar dateFromComponents:components]];
    
    return range.length;
    //phew!
    
}

// year getter
-(int) year {
    return year;
}
//year setter
-(void) setYear:(int)y  {
    year = y;
}

//month getter
-(int) month {
    return month   ;
}

//month setter
-(void) setMonth:(int)m {
    if (m < 1 || m > 12) {
        NSLog(@"setMonth: bad month passed: %d", m);
        return ;
    }
    
    month = m;

}

// day getter
-(int) day {

    return day;
}

//day setter
-(void) setDay:(int)d {
    if (d < 1 || d > [self monthLength])
    {
        NSLog(@"setDay: invalid day %d with %d month", d, month);
        return ;
        
    }
    day = d;
}

// returns true when the dates are equal
-(BOOL) isEqual:(Date *) another {
    return year == another.year && month ==another.month && day == another.day;
}


//advance date 1 day
-(void) next
{
    if (day < [self monthLength] ) {
        ++day;
        return;
    }
    //assuming here day is = monthlength so its incremented to 1
    day = 1;
    
    //now we need to check if we need to move the month
    if  (month < [Date yearLength]) {
        ++month;
        return;
    }
    //again we assume since we got here, month was 12 and now we need to be 1
    month = 1;
    
    if (year == INT_MAX) {
        
        NSLog(@"Error - you are in some really far off year %d and my int value cant hold any larger value. i will set it to 1 instead!", year);
        
        self.year = 1;
        return;
        
    }
    else
    {
    
        ++year;
    }
    
}

//advance X number of days
-(void) next:(int)distance
{
    if (distance < 0) {
		NSLog(@"value of next: %d must be non-negative", distance);
		return;
	}
	
	for (int i = 1; i <= distance; ++i) {
		[self next];
	}
    
}

//return the year length

+ (int) yearLength {
	//return 12;
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier: NSGregorianCalendar
                            ];
    
	//What is the range of months in the year that contains today?
    
	NSRange range = [calendar
                     rangeOfUnit: NSMonthCalendarUnit
                     inUnit: NSYearCalendarUnit
                     forDate: [[NSDate alloc] init]
                     ];
    
	return range.length;
    
}




//advance date 1 day
-(void) prev
{
    if (day != 1 ) {
        self.day = self.day -1;
        //nothing else to do
        return;
    } else
    {
        if (self.month != 1) {
            //devrment the month
            self.month = self.month -1;
            
        } else {
            // month = 1, so now it needs to go to yearlength
            self.month = [Date yearLength];
            self.year = self.year -1;
        }
        
        self.day = [self monthLength];
        return;
    }
}

//advance X number of days
-(void) prev:(int)distance
{
    if (distance < 0) {
		NSLog(@"value of next: %d must be non-negative", distance);
		return;
	}
	
	for (int i = 1; i <= distance; ++i) {
		[self prev];
	}
    
}






@end
