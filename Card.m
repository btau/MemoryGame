//
//  Card.m
//  MemoryGame
//
//  Created by Brett Tau on 1/25/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "Card.h"

@implementation Card

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandler:)];
        
        self.gestureRecognizers = @[tap];
    }
    return self;
}



-(void)tapHandler:(UITapGestureRecognizer *)gestureRecognizer
{
    [self.delegate cardImage:self];
}

@end
