//
//  ResultViewController.h
//  Acromine
//
//  Created by Mike Cohen on 4/28/17.
//  Copyright © 2017 Mike Cohen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) IBOutlet UITableView *table;

@property (nonatomic,strong) NSArray *sections;


@end
