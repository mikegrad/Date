//
//  DateView.m
//  Date
//
//  Created by Michael Gradilone on 10/10/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import "DateView.h"

@implementation DateView

@synthesize dateString;
@synthesize datePicker;


- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor orangeColor];
        // how would i put a datepicker on here?
        
    }
	return self;
}

- (void) drawRect: (CGRect)rect
{
	// Drawing code
	//NSString *string = *dateString;
	//CGPoint point = CGPointMake(0.0, 0.0);
	
    // how can we find the middle?
    CGRect myRect = self.bounds;
    
    CGSize mySize = myRect.size;
    
    //how do i get this right based on the font?
    //int wOffset = dateString.length /2 * 32;
    int wOffset = 75;
    
    
    // so this works, but its starting the string here, and the string itself isnt centered.
    CGPoint point = CGPointMake(mySize.width/2 - wOffset, mySize.height/2);
    
    UIFont *font = [UIFont systemFontOfSize: 32.0];
	[dateString drawAtPoint: point withFont: font];
}

@end
