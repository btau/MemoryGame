//
//  Card.h
//  MemoryGame
//
//  Created by Brett Tau on 1/25/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Card;

@protocol CardDelegate <NSObject>

- (void)cardImage:(Card *)cardImage;

@end

@interface Card : UIImageView

@property UIImage *frontImage;
@property UIImage *backImage;

@property (nonatomic, assign) id<CardDelegate> delegate;

@end
