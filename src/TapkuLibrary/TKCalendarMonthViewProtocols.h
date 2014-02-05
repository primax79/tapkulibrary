//
//  TKCalendarMonthViewProtocols.h
//  TapkuLibrary
//
//  Created by Giovanni on 05/02/14.
//
//

@import Foundation;
@import UIKit;

@class TKCalendarMonthView;

#pragma mark - TKCalendarMonthViewDelegate
/** The delegate of a `TKCalendarMonthView` object must adopt the `TKCalendarMonthViewDelegate` protocol. */
@protocol TKCalendarMonthViewDelegate <NSObject>
@optional

/** The highlighed date changed.
 @param monthView The calendar month view.
 @param date The highlighted date.
 */
- (void) calendarMonthView:(TKCalendarMonthView*)monthView didSelectDate:(NSDate*)date;


/** The calendar should change the current month to grid shown.
 @param monthView The calendar month view.
 @param month The month date.
 @param animated Animation flag
 @return YES if the month should change. NO otherwise
 */
- (BOOL) calendarMonthView:(TKCalendarMonthView*)monthView monthShouldChange:(NSDate*)month animated:(BOOL)animated;

/** The calendar will change the current month to grid shown.
 @param monthView The calendar month view.
 @param month The month date.
 @param animated Animation flag
 */
- (void) calendarMonthView:(TKCalendarMonthView*)monthView monthWillChange:(NSDate*)month animated:(BOOL)animated;

/** The calendar did change the current month to grid shown.
 @param monthView The calendar month view.
 @param month The month date.
 @param animated Animation flag
 */
- (void) calendarMonthView:(TKCalendarMonthView*)monthView monthDidChange:(NSDate*)month animated:(BOOL)animated;
@end

#pragma mark - TKCalendarMonthViewDataSource
/** The data source of a `TKCalendarMonthView` object must adopt the `TKCalendarMonthViewDataSource` protocol. */
@protocol TKCalendarMonthViewDataSource <NSObject>

/** A data source that will correspond to marks for the calendar month grid for a particular month.
 @param monthView The calendar month grid.
 @param startDate The first date shown by the calendar month grid.
 @param lastDate The last date shown by the calendar month grid.
 @return Returns an array of NSNumber objects corresponding the number of days specified in the start and last day parameters. Each NSNumber variable will give a BOOL value that will be used to display a dot under the day.
 */
- (NSArray*) calendarMonthView:(TKCalendarMonthView*)monthView marksFromDate:(NSDate*)startDate toDate:(NSDate*)lastDate;

@end