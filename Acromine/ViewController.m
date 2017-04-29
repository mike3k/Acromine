//
//  ViewController.m
//  Acromine
//
//  Created by Mike Cohen on 4/28/17.
//  Copyright © 2017 Mike Cohen. All rights reserved.
//

#import "ViewController.h"
#import "AcromineClient.h"
#import "ResultViewController.h"
#import "MBProgressHUD.h"

@interface ViewController ()
@property (nonatomic, weak) NSArray *searchResults;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwind:(UIStoryboardSegue*)sender {
    NSLog(@"Unwind: %@",sender);
    self.abbreviation.text = @"";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowResults"]) {
        ResultViewController *rvc = (ResultViewController*)segue.destinationViewController;
        rvc.sections = self.searchResults;
    }
}

- (IBAction)lookup:(id)sender {
    NSString *shortform = self.abbreviation.text;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[AcromineClient shared] getDefinitions:shortform
                                 completion:^(id  _Nullable results, NSError * _Nullable error) {
                                     [MBProgressHUD hideHUDForView:self.view animated:YES];
                                     if ((nil != results) && ((NSArray*)results).count > 0) {
                                         NSDictionary *definitions = results[0];
                                         if (definitions) {
                                             NSArray *lfs = definitions[@"lfs"];
                                             if (lfs) {
                                                 self.searchResults = lfs;
                                                 [self performSegueWithIdentifier:@"ShowResults" sender:self];
                                             }
                                         }
                                     }
                                 }];
    
}

@end
