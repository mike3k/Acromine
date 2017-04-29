//
//  ResultViewController.m
//  Acromine
//
//  Created by Mike Cohen on 4/28/17.
//  Copyright © 2017 Mike Cohen. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section < self.sections.count) {
        NSDictionary *item = self.sections[section];
        NSArray *vars = item[@"vars"];
        return vars.count;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *item = self.sections[section];
    return [NSString stringWithFormat:@"lf: %@ freq: %@, since: %@",
            item[@"lf"],
            item[@"freq"],
            item[@"since"]
            ];
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSDictionary *item = self.sections[indexPath.section];
    NSArray *vars = item[@"vars"];
    NSDictionary *row = vars[indexPath.row];

    cell.textLabel.text = [NSString stringWithFormat:@"lf: %@ freq: %@, since: %@",
                           row[@"lf"],
                           row[@"freq"],
                           row[@"since"]
                           ];
    return cell;
};



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
