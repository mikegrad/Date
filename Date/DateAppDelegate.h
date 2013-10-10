//
//  DateAppDelegate.h
//  Date
//
//  Created by Michael Gradilone on 10/3/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateView.h"

@interface DateAppDelegate : UIResponder <UIApplicationDelegate> {
    DateView *view;
}

@property (strong, nonatomic) UIWindow *window;

@end
