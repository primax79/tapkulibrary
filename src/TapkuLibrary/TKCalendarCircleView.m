//
//  TKCalendarCircleView.m
//  TapkuLibrary
//
//  Created by Giovanni on 15/09/14.
//
//

#import "TKCalendarCircleView.h"
#import "TKScale.h"

@interface TKCalendarCircleView ()
@property (nonatomic, strong) CAShapeLayer *shapeView;
@end

@implementation TKCalendarCircleView

- (id)initWithColor:(UIColor *)newColor
{
	self = [super initWithFrame:CGRectMake(0, 0, 46*[TKScale factor], 44*[TKScale factor])];
	if (self) {
		UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:self.center radius:18*[TKScale factor] startAngle:0 endAngle:(2 * M_PI) clockwise:YES];
		_shapeView = [[CAShapeLayer alloc] init];
		[_shapeView setPath:circle.CGPath];
		[[self layer] addSublayer:_shapeView];
		self.backgroundColor = [UIColor clearColor];
		self.circleColor = newColor;
	}
	return self;
}

- (void)setCircleColor:(UIColor *)newCircleColor
{
	self->_circleColor = newCircleColor;
	[_shapeView setFillColor:self.circleColor.CGColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
	//drawRect did not work for me. For this reason I started using CAShapeLayer
//}


@end
