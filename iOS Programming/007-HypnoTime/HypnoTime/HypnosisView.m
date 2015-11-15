//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Craig Bennett on 11/14/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

@synthesize circleColor;

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self)
    {
        // All hypnosis views staer with e clear background color
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }

    return self;
}

- (void) setCircleColor:(UIColor *)cc
{
    circleColor = cc;
    [self setNeedsDisplay];
}

- (void) drawRect: (CGRect)diretyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];

    // Determine the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    // The radius of the circle should be nearly as big as the view
    float maxRadius = hypot (bounds.size.width, bounds.size.height) / 2.0;

    // The thickness of the line should be ten points wide
    CGContextSetLineWidth (ctx, 10);

    // The color of the line should be gray
    [[self circleColor] setStroke];

    // Draw concentric circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        // Add a path to the context
        CGContextAddArc (ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);

        // Perform drawing instruction, removes path
        CGContextStrokePath (ctx);
    }

    // Create a string
    NSString *text = @"You are getting sleepy";

    // Get a font to draw it in
    UIFont *font = [UIFont boldSystemFontOfSize:28];

    CGRect textRect;

    // How big is this string when drawn in this font?
    textRect.size = [text sizeWithFont:font];

    // Put the string in the center of the view
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;

    // Set the fill color of the current context to black
    [[UIColor blackColor] setFill];

    // Shadow that will be 4 points to the right and three points down
    CGSize offset = CGSizeMake (4, 3);

    // The shadow will be dark gray in color
    CGColorRef color = [[UIColor darkGrayColor] CGColor];

    // Set the shadow of the context with these parameters
    // All subsequent drawing will be shadowed
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);

    // Draw in the string
    [text drawInRect:textRect withFont:font];

}

@end
