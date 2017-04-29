//
//  ViewController.h
//  Acromine
//
//  Created by Mike Cohen on 4/28/17.
//  Copyright © 2017 Mike Cohen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *abbreviation;

@property (nonatomic, strong) IBOutlet UIButton *lookupButton;

- (IBAction)lookup:(id)sender;

- (IBAction)unwind:(UIStoryboardSegue*)sender;


@end

