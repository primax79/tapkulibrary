//
//  TKScale.m
//  TapkuLibrary
//
//  Created by Giovanni on 15/09/14.
//
//

#import "TKScale.h"

@implementation TKScale

+ (CGFloat)factor
{
	if (CGRectGetWidth(UIScreen.mainScreen.bounds) == 375.0f) { //iPhone 6
		return 1.17f;
	}
	else if(CGRectGetWidth(UIScreen.mainScreen.bounds) == 414.0f) { //iPhone 6 Plus
		return 1.29f;
	}
	//iPhone 5s and earlier
	return 1.0f;
}

@end
