//
//  ViewController.m
//  TableViewDummyApp
//
//  Created by Adrian Florescu on 15.07.15.
//  Copyright (c) 2015 Adrian Florescu. All rights reserved.
//

#import "ViewController.h"
#import "CellA.h"
#import "CellB.h"
#import <sys/utsname.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel     *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel     *lblSubtitle;

@end

@implementation ViewController {
    NSArray *tableData;
    int     count;
    int     rows;
}
- (IBAction)doX2:(id)sender {
    rows             *= 2;
    _lblSubtitle.text = [NSString stringWithFormat:@"Now we have %d rows", rows];
    [_tableView reloadData];
}

- (IBAction)doCrashAction:(id)sender {
    UIFont       *font = [UIFont fontWithName:@"Arial-BoldMT" size:16];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    NSLog(@"Dictonary %@", dict);
    int b = 0;
    int a = 43/b;
    NSLog(@"%d", a);
    NSArray *ab = [[NSArray alloc] init];
    NSLog(@"%@", ab[0]);
}

- (IBAction)doAction:(id)sender {
    NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    _lblTitle.text = [_lblTitle.text stringByAppendingString:@" "];
    _lblTitle.text = [_lblTitle.text stringByAppendingString:bundleVersion];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    count = 0;
    rows  = 2;

    // unrelated
    NSLog(@"vendor: %@", [self appVendorId]);
    NSLog(@"device: %@", [self deviceType]);
    NSLog(@"osversion: %@", [self osVersion]);

    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto is a very very very very long label. Trust me on that! Now it is even a looooooooooooooooooooooooooooooooooooooooooooooot longer.", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];

    // setup
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1) {
        _tableView.rowHeight          = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 10.0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)appVendorId {
    NSString *vendorID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return vendorID;//[vendorID stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

- (NSString *)deviceType {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceName = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceName;
}

- (NSString *)osVersion {
    return [NSString stringWithFormat:@"%@ %@", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
}

#pragma Table Delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return rows;
}

#define MET4

#ifdef MET1
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSString *simpleTableIdentifier = @"TitleAndDetailCell";
        CellA           *cell                  = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil) {
            NSLog(@"Allocating cell. %d", ++count);
            cell = [[CellA alloc] init];
        }
        cell.lblBig.text   = [tableData objectAtIndex:arc4random_uniform(tableData.count)];
        cell.lblSmall.text = [tableData objectAtIndex:arc4random_uniform(tableData.count)];
        return cell;
    }

    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSNumber *height;
        if (!height) {
            UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TitleAndDetailCell"];
            height = @(cell.bounds.size.height);
        }
        return [height floatValue];
    }

#endif

#ifdef MET2
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSString *simpleTableIdentifier = @"NonExistent";
        UITableViewCell *cell                  = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil) {
            NSLog(@"Allocating cell. %d", ++count);
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
        cell.textLabel.text = [tableData objectAtIndex:arc4random_uniform(tableData.count)];
        return cell;
    }

#endif

#ifdef MET3
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        NSLog(@"Allocating cell. %d", ++count);
        CellA *cell = [[CellA alloc] init];
        cell.lblBig.text   = [tableData objectAtIndex:arc4random_uniform(tableData.count)];
        cell.lblSmall.text = [tableData objectAtIndex:arc4random_uniform(tableData.count)];
        return cell;
    }

    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 74;
    }

#endif

#ifdef MET4
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSString *simpleTableIdentifier = @"ImageWithDescriptionCell";
        CellB           *cell                  = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil) {
            NSLog(@"Allocating cell. %d", ++count);
            cell = [[CellB alloc] init];
        }
        cell.lblDescription.text = [tableData objectAtIndex:arc4random_uniform((int)tableData.count)];

        return cell;
    }

#endif

// for iOS7
#ifdef MET5
    #define FONT_SIZE 16
    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSNumber *height;
        if (!height) {
            UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ImageWithDescriptionCell"];
            height = @(cell.bounds.size.height);
        }
        return [height floatValue];
    }

#endif

@end
