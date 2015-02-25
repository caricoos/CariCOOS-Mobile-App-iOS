//
//  TableViewController.m
//  CariCOOS
//
//  Created by Pedro Correa on 10/11/14.
//  Copyright (c) 2014 CariCOOS. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property (strong, nonatomic) IBOutlet UISwitch *CariCOOS;
@property (strong, nonatomic) IBOutlet UISwitch *Wind;
@property (strong, nonatomic) IBOutlet UISwitch *Swan;

@property (strong, nonatomic) IBOutlet UISwitch *Normal;
@property (strong, nonatomic) IBOutlet UISwitch *Hybrid;
@property (strong, nonatomic) IBOutlet UISwitch *Satellite;
@property (strong, nonatomic) IBOutlet UISwitch *Terrain;
@property (strong, nonatomic) IBOutlet UISwitch *None;

@property (strong, nonatomic) IBOutlet UISwitch *USVI;
@property (strong, nonatomic) IBOutlet UISwitch *sanjuan;
@property (strong, nonatomic) IBOutlet UISwitch *West;

@property (strong, nonatomic) IBOutlet UISwitch *PuertoRico;

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"title"]];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)PuertoRico:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            
            [standardDefaults setObject:@"On" forKey:@"PuertoRico"];
            
            self.sanjuan.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"SanJuan"];
            
            self.West.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"West"];
            
            self.USVI.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"USVI"];
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"PuertoRico"];
            
        }
        
        
    }
    
    
    
    [standardDefaults synchronize];
    
}

- (IBAction)USVI:(UISwitch *)sender {
    
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            
            [standardDefaults setObject:@"On" forKey:@"USVI"];
            
            self.sanjuan.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"SanJuan"];
            
            self.West.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"West"];
            
            self.PuertoRico.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"PuertoRico"];
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"USVI"];
            
        }
        
        
    }
   
    
    [standardDefaults synchronize];
}

- (IBAction)SanJuan:(UISwitch *)sender {
    
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            
            [standardDefaults setObject:@"On" forKey:@"SanJuan"];
            
            self.USVI.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"USVI"];
            
            self.West.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"West"];
            
            self.PuertoRico.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"PuertoRico"];
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"SanJuan"];
            
        }
        
        
    }
    
   
    
    [standardDefaults synchronize];
    
    
}

- (IBAction)West:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            
            [standardDefaults setObject:@"On" forKey:@"West"];
            
            self.USVI.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"USVI"];
            
            self.sanjuan.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"SanJuan"];
            
            self.PuertoRico.on = NO;
            
            [standardDefaults setObject:@"Off" forKey:@"PuertoRico"];
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"West"];
            
        }
        
        
    }
    

    
    [standardDefaults synchronize];
    
}


- (IBAction)CariCOOS:(UISwitch *)sender {
    
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            
            [standardDefaults setObject:@"On" forKey:@"CariCOOS"];
            
           
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"CariCOOS"];
            
        }
        
        
    }
    
    [standardDefaults synchronize];
    
}
- (IBAction)Wind:(UISwitch *)sender {
    
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            
            [standardDefaults setObject:@"On" forKey:@"Wind"];
            
            
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"Wind"];
            
        }
        
        
    }
    
    [standardDefaults synchronize];
    
    
}
- (IBAction)Swan:(UISwitch *)sender {
    
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            
            [standardDefaults setObject:@"On" forKey:@"Swan"];
            
            
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"Swan"];
            
        }
        
        
    }
    
    [standardDefaults synchronize];
    
}

- (IBAction)Normal:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            
            [standardDefaults setObject:@"On" forKey:@"Normal"];
            
            self.Hybrid.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Hybrid"];
            self.Satellite.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Satellite"];
            self.Terrain.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Terrain"];
            self.None.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"None"];
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"Normal"];
            
        }
        
        
    }
    

    
    [standardDefaults synchronize];
    
}

- (IBAction)Hybrid:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            [standardDefaults setObject:@"On" forKey:@"Hybrid"];
            
            self.Normal.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Normal"];
            self.Satellite.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Satellite"];
            self.Terrain.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Terrain"];
            self.None.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"None"];
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"Hybrid"];
            
        }
        
        
    }
    
    [standardDefaults synchronize];
}


- (IBAction)Satellite:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            [standardDefaults setObject:@"On" forKey:@"Satellite"];
            
            self.Normal.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Normal"];
            self.Hybrid.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Hybrid"];
            self.Terrain.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Terrain"];
            self.None.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"None"];
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"Satellite"];
            
        }
        
        
    }
    
    
    [standardDefaults synchronize];
}

- (IBAction)Terrain:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            [standardDefaults setObject:@"On" forKey:@"Terrain"];
            
            self.Normal.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Normal"];
            self.Hybrid.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Hybrid"];
            self.Satellite.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Satellite"];
            self.None.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"None"];
            
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"Terrain"];
            
        }
        
        
    }
    
    
    [standardDefaults synchronize];
}

- (IBAction)None:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if (sender.tag == 0){
        
        if (sender.on ==1){
            
            [standardDefaults setObject:@"On" forKey:@"None"];
            
            self.Normal.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Normal"];
            self.Hybrid.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Hybrid"];
            self.Satellite.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Satellite"];
            self.Terrain.on = NO;
            [standardDefaults setObject:@"Off" forKey:@"Terrain"];
            
        }
        else if (sender.on == 0){
            
            [standardDefaults setObject:@"Off" forKey:@"None"];
            
        }
        
        
    }
    
    
    [standardDefaults synchronize];
}

-(void) viewDidAppear:(BOOL)animated{
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    [standardDefaults setObject:@"On" forKey:@"LAYER"];
    [standardDefaults setObject:@"On" forKey:@"BOOL"];
    
    if([[standardDefaults stringForKey:@"Normal"]isEqualToString:@"Off"] && [[standardDefaults stringForKey:@"Hybrid"]isEqualToString:@"Off"] && [[standardDefaults stringForKey:@"Satellite"]isEqualToString:@"Off"] && [[standardDefaults stringForKey:@"Terrain"]isEqualToString:@"Off"] && [[standardDefaults stringForKey:@"None"]isEqualToString:@"Off"])
    {
        
        self.Normal.on = YES;
        [standardDefaults setObject:@"On" forKey:@"Normal"];
        
        
    }
    
    if ([[standardDefaults stringForKey:@"Normal"]isEqualToString:@"On"]){
        
        self.Normal.on = YES;
        [standardDefaults setObject:@"On" forKey:@"Normal"];
        
        self.Hybrid.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Hybrid"];
        self.Satellite.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Satellite"];
        self.Terrain.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Terrain"];
        self.None.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"None"];
        
    }
    if ([[standardDefaults stringForKey:@"Hybrid"]isEqualToString:@"On"]){
        
        self.Hybrid.on = YES;
        
        [standardDefaults setObject:@"On" forKey:@"Hybrid"];
        
        self.Normal.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Normal"];
        self.Satellite.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Satellite"];
        self.Terrain.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Terrain"];
        self.None.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"None"];
        
    }
    if ([[standardDefaults stringForKey:@"Satellite"]isEqualToString:@"On"])
    {
        
        self.Satellite.on = YES;
        
        [standardDefaults setObject:@"On" forKey:@"Satellite"];
        
        self.Normal.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Normal"];
        self.Hybrid.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Hybrid"];
        self.Terrain.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Terrain"];
        self.None.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"None"];
        
    }
    if ([[standardDefaults stringForKey:@"Terrain"]isEqualToString:@"On"]){
        
        self.Terrain.on = YES;
        
        [standardDefaults setObject:@"On" forKey:@"Terrain"];
        
        self.Normal.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Normal"];
        self.Hybrid.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Hybrid"];
        self.Satellite.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Satellite"];
        self.None.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"None"];
        
    }
    if ([[standardDefaults stringForKey:@"None"]isEqualToString:@"On"]){
        
        self.None.on = YES;
        
        [standardDefaults setObject:@"On" forKey:@"None"];
        
        self.Normal.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Normal"];
        self.Hybrid.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Hybrid"];
        self.Satellite.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Satellite"];
        self.Terrain.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"Terrain"];
        
        
    }
    if ([[standardDefaults stringForKey:@"USVI"]isEqualToString:@"On"]){
        
        self.USVI.on = YES;
        
        [standardDefaults setObject:@"On" forKey:@"USVI"];
        
        self.sanjuan.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"SanJuan"];
        self.West.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"West"];
        self.PuertoRico.on = NO;
        
        [standardDefaults setObject:@"Off" forKey:@"PuertoRico"];
        
        
    }

    if ([[standardDefaults stringForKey:@"SanJuan"]isEqualToString:@"On"]){
        
        
        self.sanjuan.on = YES;
        
        [standardDefaults setObject:@"On" forKey:@"SanJuan"];
        
        self.USVI.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"USVI"];
        self.West.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"West"];
        self.PuertoRico.on = NO;
        
        [standardDefaults setObject:@"Off" forKey:@"PuertoRico"];
        
        
    }
    if ([[standardDefaults stringForKey:@"West"]isEqualToString:@"On"]){
        
        self.West.on = YES;
        
        [standardDefaults setObject:@"On" forKey:@"West"];
        
        self.sanjuan.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"SanJuan"];
        self.USVI.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"USVI"];
        self.PuertoRico.on = NO;
        
        [standardDefaults setObject:@"Off" forKey:@"PuertoRico"];
        
        
    }
    
    if ([[standardDefaults stringForKey:@"PuertoRico"]isEqualToString:@"On"]){
        
        self.PuertoRico.on = YES;
        
        [standardDefaults setObject:@"On" forKey:@"PuertoRico"];
        
        self.sanjuan.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"SanJuan"];
        self.USVI.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"USVI"];
        self.West.on = NO;
        [standardDefaults setObject:@"Off" forKey:@"West"];
        
        
    }
    
    if ([[standardDefaults stringForKey:@"CariCOOS"]isEqualToString:@"On"]){
        
        self.CariCOOS.on = YES;
        
        [standardDefaults setObject:@"On" forKey:@"CariCOOS"];
      
        
        
    }
   
    if ([[standardDefaults stringForKey:@"Wind"]isEqualToString:@"On"]){
        
        self.Wind.on = YES;

        [standardDefaults setObject:@"On" forKey:@"Wind"];
        
        
    }
    
    if ([[standardDefaults stringForKey:@"Swan"]isEqualToString:@"On"]){
        
        self.Swan.on = YES;
        
        [standardDefaults setObject:@"On" forKey:@"Swan"];
        
        
    }
    
    [standardDefaults synchronize];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
