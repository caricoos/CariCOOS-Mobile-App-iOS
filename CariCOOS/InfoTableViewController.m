//
//  InfoTableViewController.m
//  CariCOOS
//
//  Created by Pedro Correa on 10/14/14.
//  Copyright (c) 2014 CariCOOS. All rights reserved.
//


#import "InfoTableViewController.h"
#import <QuartzCore/QuartzCore.h>



@interface InfoTableViewController ()

@property (nonatomic, assign) bool hideTableSection;
@property (nonatomic, assign) bool hideRinconSection;



@end

@implementation InfoTableViewController{
    
}

NSString *updated;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    //Controls whether the My Location dot and accuracy circle is enabled.
    self.mapView.myLocationEnabled = YES;
    //Controls the type of map tiles that should be displayed.
    self.mapView.mapType = kGMSTypeNormal;
    //Shows the compass button on the map
    self.mapView.settings.compassButton = YES;   //Shows the my location button on the map
    self.mapView.settings.myLocationButton = YES;   //Sets the view controller to be the GMSMapView delegate
    self.mapView.delegate = self;
    
    
    
    
 // self.navigationItem.title = self.b_name;
   // [self.navigationController.navigationBar
    // setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"title"]];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    if([self.b_wwc isEqualToString:@"Wind"]){
        self.hideTableSection = YES;
    }
    
    if([self.b_wwc isEqualToString:@"Wave"]){
        self.hideRinconSection = YES;
    }
    
    //[self.image_Wave bringSubviewToFront:self.view];
    
    //[self.tableView. setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.Name.text = self.b_name;
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-mm-dd"];
    
    NSDate *date1 = [formatter dateFromString:self.b_date];
    
    [formatter setDateFormat:@"dd/mm/yyyy"];

    NSString *outString = [formatter stringFromDate:date1];
    
    
    
    self.Date.text = outString;
    
    
    NSString *dateStr = self.b_time;
    
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    
    // Convert date object to desired output format
    [dateFormat setDateFormat:@"hh:mm a"];
    
    dateStr = [dateFormat stringFromDate:date];
   
     NSDate *date4 = [dateFormat dateFromString:dateStr];
    
    date4 = [date4 dateByAddingTimeInterval:-3600*4];
    
    dateStr = [dateFormat stringFromDate:date4];
    
    self.Time.text = dateStr;
    
    updated = @"";
    
    updated = @"UPDATED:";
    
    updated = [updated stringByAppendingString:outString];
    
    updated = [updated stringByAppendingString:@" "];
    
    updated = [updated stringByAppendingString:dateStr];
    
    
    
    
    self.WWC.text = self.b_wwc;
    [self.Image setImage:[UIImage imageNamed:self.b_image]];
    
    self.Height.text = self.b_height;
    self.Period.text = self.b_period;
    self.Direction.text = self.b_direction;
    
    
    
    NSString *pic = windDirectionForDegrees(self.b_wind_angle);
    
    [self.Image_wind setImage:[UIImage imageNamed:pic]];
    
    pic = windDirectionForDegrees(self.b_angle);
    
    [self.image_Wave setImage:[UIImage imageNamed:pic]];
    
    pic = currDirectionForDegrees(self.b_curr_dic);
    
    [self.Image_curr setImage:[UIImage imageNamed:pic]];
    
    
    
    self.Current_spd.text = self.b_curr_spd;
    self.Current_dicc.text = self.b_curr_str;
    
    self.wind_speed.text = self.b_wind_speed;
    self.wind_gust.text = self.b_wind_gust;
    self.wind_dic.text = self.b_wind_dic;
    //self.air_temp.text = self.b_air_temp;
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

static NSString *windDirectionForDegrees(double degrees) {
    static NSString *const Directions[] = {
        @"S",  @"SW", @"W",  @"NW",
        @"N",  @"NE",  @"E",  @"SE"
    };
    static const int DirectionsCount = sizeof Directions / sizeof *Directions;
    
    int wind = remainder(round((degrees / 360) * DirectionsCount), DirectionsCount);
    if (wind < 0) wind += DirectionsCount;
    return Directions[wind];
}

static NSString *currDirectionForDegrees(double degrees) {
    static NSString *const Directions[] = {
        @"cur_N",  @"cur_NE", @"cur_E",  @"cur_SE",
        @"cur_S",  @"cur_SW",  @"cur_W",  @"cur_NW"
    };
    static const int DirectionsCount = sizeof Directions / sizeof *Directions;
    
    int wind = remainder(round((degrees / 360) * DirectionsCount), DirectionsCount);
    if (wind < 0) wind += DirectionsCount;
    return Directions[wind];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    //[[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextColor:[UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1]];
    
    if(section == 1 && self.hideTableSection){
       // [ setBackgroundColor:[UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1];

        return [[UIView alloc] initWithFrame:CGRectZero];
    }
    if(section == 3 && self.hideTableSection)
        return [[UIView alloc] initWithFrame:CGRectZero];
    
    
    //Rincon
    if(section == 2 && self.hideRinconSection){
        // [ setBackgroundColor:[UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1];
        
        return [[UIView alloc] initWithFrame:CGRectZero];
    }
    if(section == 3 && self.hideRinconSection){
        // [ setBackgroundColor:[UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1];
        
        return [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 1 && self.hideTableSection)
        return 1;
    if(section == 3 && self.hideTableSection)
        return 1;
    
    if(section == 2 && self.hideRinconSection)
        return 1;
    if(section == 3 && self.hideRinconSection)
        return 1;
    
    return 32;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 1 && self.hideTableSection)
        return 1;
    if(section == 3 && self.hideTableSection)
        return 1;
    
    if(section == 2 && self.hideRinconSection)
        return 1;
    if(section == 3 && self.hideRinconSection)
        return 1;
    
    return 16;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section == 1 && self.hideTableSection)
        return [[UIView alloc] initWithFrame:CGRectZero];
    if(section == 3 && self.hideTableSection)
        return [[UIView alloc] initWithFrame:CGRectZero];
    
    if(section == 2 && self.hideRinconSection)
        return [[UIView alloc] initWithFrame:CGRectZero];
    if(section == 3 && self.hideRinconSection)
        return [[UIView alloc] initWithFrame:CGRectZero];
    
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Set the text color of our header/footer text.
    //UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    //[header.textLabel setTextColor:[UIColor whiteColor]];
    
    // Set the background color of our header/footer.
    //header.contentView.backgroundColor = [UIColor blackColor];
    
    // You can also do this to set the background color of our header/footer,
    //    but the gradients/other effects will be retained.
    // view.tintColor = [UIColor blackColor];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //cell.backgroundColor = [UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 1;
    }
    if(section == 1)
    {
        if(self.hideTableSection)
            return 0;
        else
            return 3;
    }
    if(section == 2)
    {
        if(self.hideRinconSection)
            return 0;
        
            return 3;
    }
    if(section == 3)
    {
        if(self.hideTableSection)
            return 0;
        
        if(self.hideRinconSection)
            return 0;
        else
            return 2;
    }
    else
    {
        return 2;
    }
}


/*
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    //TEMP SECTION STRING HOLDER:
    NSString *sectionHeader;
    
    
    //SET TITLE FOR EACH SECTION:
    if(section == 0) {
        
        sectionHeader = updated;
        
    }
    
    if(section == 1){
        
        sectionHeader = @"Wind";
    }

    return sectionHeader;
    
}
(
 
 */

/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
*/
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
