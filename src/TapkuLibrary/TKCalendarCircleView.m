//
//  TKCalendarCircleView.m
//  TapkuLibrary
//
//  Created by Giovanni on 15/09/14.
//
//

#import "TKCalendarCircleView.h"
#import "TKScale.h"

@implementation TKCalendarCircleView

- (id)initWithColor:(UIColor *)newColor
{
	self = [super initWithFrame:CGRectMake(0, 0, 46*[TKScale factor], 44*[TKScale factor])];
	if (self) {
		self.backgroundColor = [UIColor clearColor];
		self.circleColor = newColor;
		
		UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:self.center radius:18*[TKScale factor] startAngle:0 endAngle:(2 * M_PI) clockwise:YES];
		CAShapeLayer *shapeView = [[CAShapeLayer alloc] init];
		[shapeView setPath:circle.CGPath];
		[[self layer] addSublayer:shapeView];

	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
	//drawRect did not work for me. For this reason I started using CAShapeLayer
//}


@end
