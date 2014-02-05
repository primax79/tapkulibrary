//
//  TKCalendarMonthView.h
//  Created by Devin Ross on 6/10/10.
//
/*
 
 tapku || http://github.com/devinross/tapkulibrary
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */

@import Foundation;
@import UIKit;
#import "TKCalendarMonthView.h"
#import "TKCalendarMonthViewProtocols.h"

@protocol TKCalendarMonthViewDelegate, TKCalendarMonthViewDataSource;

#pragma mark - TKCalendarMonthView
/** `TKCalendarMonthView` imitates the month grid in the Calendar app on iPhone. */
@interface TKCalendarMonthView_ios7 : TKCalendarMonthView

/** Initialize a Calendar Month Grid.
 @param timeZone The time zone of the grid,
 @return A `TKCalendarMonthView` object or nil.
 */
- (id) initWithTimeZone:(NSTimeZone*)timeZone; // or Monday


/** Initialize a Calendar Month Grid.
 @param sunday Flag to setup the grid with Monday or Sunday as the leftmost day.
 @param timeZone The time zone of the grid,
 @return A `TKCalendarMonthView` object or nil.
 */
- (id) initWithSundayAsFirst:(BOOL)sunday timeZone:(NSTimeZone*)timeZone;

/** Initialize a Calendar Month Grid.
 @param sunday Flag to setup the grid with Monday or Sunday as the leftmost day.
 @return A `TKCalendarMonthView` object or nil.
 */
- (id) initWithSundayAsFirst:(BOOL)sunday;

/** The delegate must adopt the `TKCalendarMonthViewDelegate` protocol. The delegate is not retained. */
@property (nonatomic,assign) id <TKCalendarMonthViewDelegate> delegate;

/** The data source must adopt the `TKCalendarMonthViewDataSource` protocol. The data source is not retained. */
@property (nonatomic,assign) id <TKCalendarMonthViewDataSource> dataSource;

/** The time zone for calendar grid. */
@property (nonatomic,strong) NSTimeZone *timeZone;


/** The current date highlighted on the month grid.
 @return An `NSDate` object set to the month, year and day of the current selection.
 */
- (NSDate*) dateSelected;


/** The current month date being displayed.
 @return An `NSDate` object set to the month and year of the current month grid.
 */
- (NSDate*) monthDate;

/** Selects a specific date in the month grid.
 @param date The date that will be highlighed.
 */
- (BOOL) selectDate:(NSDate*)date;

/** Reloads the current month grid. */
- (void) reloadData;

/** Animates the calendar to the next or previous month.
 @param next YES for next month, NO for previous month.
 */
- (void) animateToNextOrPreviousMonth:(BOOL)next;

/** Set the tint colour to use for user interface elements */
+ (UIColor*) setImageTintColour:(UIColor*)color;

@end