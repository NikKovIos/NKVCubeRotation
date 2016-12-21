//
//  ViewController.m
//  CubeTransition
//
//  Created by Nikita Kovalenok on 21.12.16.
//  Copyright © 2016 NikKovIos. All rights reserved.
//

#import "ViewController.h"
#import "TransitionCell.h"
#import "SecondViewController.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
CellDelegateProtocol,
CAAnimationDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController


#pragma mark - LIVE CICLE

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TransitionCell" bundle:nil] forCellReuseIdentifier:@"TouchCell"];
}

#pragma mark - SETUP/INIT
#pragma mark - METHODS
#pragma mark - DELEGATE/SOURCE

- (void)firstButtonTap
{

}

- (void)secondButtonTap
{
    
}

#pragma mark TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TransitionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TouchCell" forIndexPath:indexPath];
//    cell.textLabel.text = [NSString stringWithFormat: @"Cell %ld", (long)indexPath.row];
    cell.cellDelegate = self;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self rotation1:cell];
//    [self rotation2:cell];
    
}

- (void)rotation1:(UITableViewCell *)cell
{
    
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}

- (void)rotation2:(UITableViewCell *)cell
{
    CATransform3D rotationY;
    rotationY = CATransform3DMakeRotation(degToRad(90), 0, -1, 0);

    rotationY = CATransform3DTranslate(rotationY, 0, 0, cell.contentView.bounds.size.width / 2);
    rotationY.m34 = 1.0f / 1000.0f;
    cell.layer.anchorPoint = CGPointMake(0.5, 0.5);
    cell.layer.transform = CATransform3DIdentity;

    [UIView beginAnimations:@"rotationY" context:NULL];
    [UIView setAnimationDuration:2.0];
    cell.layer.transform = rotationY;
    [UIView commitAnimations];
}

#pragma mark - ACTIONS
#pragma mark - OTHER

@end
