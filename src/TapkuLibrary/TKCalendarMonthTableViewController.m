//
//  TKCalendarMonthTableViewController.m
//  Created by Devin Ross on 10/31/09.
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
#import "TKCalendarMonthTableViewController.h"
#import "NSDate+TKCategory.h"

@implementation TKCalendarMonthTableViewController

static NSString *CellIdentifier = @"TKMonthDetailCell";

- (void) loadView{
	[super loadView];
	self.tableView.backgroundColor = [UIColor whiteColor];
	
	float y,height;
	y = CGRectGetMaxY(self.monthView.frame);
	height = CGRectGetHeight(self.view.frame) - y;
		
	
	_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, y, CGRectGetWidth(self.view.bounds), height) style:UITableViewStylePlain];
	[_tableView registerNib:[UINib nibWithNibName:CellIdentifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CellIdentifier];
	_tableView.delegate = self;
	_tableView.dataSource = self;
	_tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:_tableView];
	[self.view sendSubviewToBack:_tableView];
}



#pragma mark TableView Delegate & Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 0;	
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (TKMonthDetailCell *) tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TKMonthDetailCell *cell = (TKMonthDetailCell*)[tv dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    return cell;
}

#pragma mark Month View Delegate & Data Source
- (void) calendarMonthView:(TKCalendarMonthView*)monthView didSelectDate:(NSDate*)d{
}
- (void) calendarMonthView:(TKCalendarMonthView*)monthView monthDidChange:(NSDate*)month animated:(BOOL)animated{
	[self updateTableOffset:animated];
}

- (void) updateTableOffset:(BOOL)animated{
	
	
	if(animated){
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.4];
		[UIView setAnimationDelay:0.1];
	}

	
	CGFloat y = CGRectGetMaxY(self.monthView.frame);
	self.tableView.frame = CGRectMake(CGRectGetMinX(self.tableView.frame), y, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(self.view.frame) - y);
	
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
		//FIX for table view being shifted ~60px to the bottom. http://stackoverflow.com/questions/18388429/uitableview-is-starting-with-an-offset-in-ios-7
		//This has something to do with iOS7+ automatically adjusting scrollview insets for table views
		//Note: setting [self setAutomaticallyAdjustsScrollViewInsets:NO]; in loadView: does not work
		self.tableView.contentInset = UIEdgeInsetsMake(-self.topLayoutGuide.length, 0, 0, 0);
	}
	
	if(animated) [UIView commitAnimations];
}







@end
