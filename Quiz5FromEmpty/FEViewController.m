//
//  FEViewController.m
//  Quiz5FromEmpty
//
//  Created by Michael Toth on 3/16/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "FEViewController.h"
#import "FETask.h"
#import "FEDetailViewController.h"

@interface FEViewController ()

@end

@implementation FEViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"My Tasks"];
    tasks = [[NSMutableArray alloc] init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    for (int i=0; i<10; i++) {
        FETask *task = [[FETask alloc] init];
        [task setTaskName:[NSString stringWithFormat:@"Task %d",i]];
        [task setUrgency:i];
        [task setDueDate:[NSDate dateWithTimeIntervalSinceNow:i*60.0*60.0*24.0]];
        [tasks addObject:task];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [tasks sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        FETask *t1=obj1;
        FETask *t2 = obj2;
        return [t1.dueDate compare:t2.dueDate];
    }];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    // Configure the cell...
    FETask *t = [tasks objectAtIndex:[indexPath row]];
    [cell.textLabel setText:[t taskName]];
    UIColor *taskColor = [UIColor colorWithRed:t.urgency/10.0 green:1.0-(t.urgency/10.0) blue:0.0 alpha:0.5];
    [cell.contentView setBackgroundColor:taskColor];
    [cell.detailTextLabel setBackgroundColor:[UIColor clearColor]];
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    [cell.imageView setBackgroundColor:taskColor];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterLongStyle];
    [cell.detailTextLabel setText:[df stringFromDate:t.dueDate]];
    if (t.urgency > 6) {
        [[cell imageView] setImage:[UIImage imageNamed:@"urgent.jpg"]];
    } else {
        [[cell imageView] setImage: nil];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FEDetailViewController *dvc = [[FEDetailViewController alloc] initWithNibName:nil bundle:nil];
    dvc.task = [tasks objectAtIndex:[indexPath row]];
    [self.navigationController pushViewController:dvc animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
