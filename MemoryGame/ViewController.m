//
//  ViewController.m
//  MemoryGame
//
//  Created by Brett Tau on 1/25/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"

@interface ViewController () <CardDelegate>

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *cardCollection;

@property NSArray *imagesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imagesArray = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"ernieBanks"],
                        [UIImage imageNamed:@"griffey"],
                        [UIImage imageNamed:@"letterman"],
                        [UIImage imageNamed:@"mantle"],
                        [UIImage imageNamed:@"ronSanto"],
                        [UIImage imageNamed:@"ryneSandberg"],
                        [UIImage imageNamed:@"sammySosa"],
                        [UIImage imageNamed:@"willFerrell"],
                        [UIImage imageNamed:@"ernieBanks"],
                        [UIImage imageNamed:@"griffey"],
                        [UIImage imageNamed:@"letterman"],
                        [UIImage imageNamed:@"mantle"],
                        [UIImage imageNamed:@"ronSanto"],
                        [UIImage imageNamed:@"ryneSandberg"],
                        [UIImage imageNamed:@"sammySosa"],
                        [UIImage imageNamed:@"willFerrell"],
                        nil];
    
    
    //call shuffle method on images array
    [self shuffleData:[NSMutableArray arrayWithArray:self.imagesArray] completionHandler:^(NSArray *array) {
        self.imagesArray = array;
    }];
    
    
    //assigning random image to imageViews
    for (Card *card in self.cardCollection) {
        card.frontImage = [self.imagesArray objectAtIndex:card.tag];
        card.backImage = [UIImage imageNamed:@"baseball"];
        card.image = card.backImage;
        card.delegate = self;
    }
    
    
    //On-boarding page for first load of app
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if (![userDefaults boolForKey:@"firstLaunch"]) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        imageView.image = [UIImage imageNamed:@"memoryMatch"];
        [self.parentViewController.view addSubview:imageView];
        [userDefaults setBool:YES forKey:@"firstLaunch"];
    }

}


// custom delegate method
-(void)cardImage:(Card *)cardImage {
    cardImage.image = [self.imagesArray objectAtIndex:cardImage.tag];

    
}


//shuffle method
- (void)shuffleData:(NSMutableArray *)input completionHandler:(void (^)(NSArray *array))completionHandler {
   
    NSUInteger count = input.count;
    for (int i = 0; i < count - 1; i++) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((unsigned int)remainingCount);
        [input exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    completionHandler([NSArray arrayWithArray:input]);
}



@end
