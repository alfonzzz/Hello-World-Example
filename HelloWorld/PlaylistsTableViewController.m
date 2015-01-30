//
//  PlaylistsTableViewController.m
//  HelloWorld
//
//  Created by Allon Freedman on 30/1/15.
//  Copyright (c) 2015 Alfonzzz. All rights reserved.
//

#import "PlaylistsTableViewController.h"
#import "PlaylistViewController.h"

@interface PlaylistsTableViewController ()

@property (strong, nonatomic) NSArray *playlistsModel;

@end

@implementation PlaylistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

  // Initialize our data model
  self.playlistsModel = [self loadModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    // We can separate our list into sections with titles or groups - in our case we'll just have one list
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If we had multiple sections we'd use a switch case here and return the number of rows in each section
    // but because we only have one we don't need to. The number of rows is the number of items in our model
    return self.playlistsModel.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // We're just using the default UITableViewCell which has a couple of labels. We could customize it with any
    // view if we wanted. The reuseIdentifier allows us to specify different prototypes so that we can have
    // different kinds of cells in our table view
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    // Configure the cell...

    // Set the label text to the playlist at the given index
    cell.textLabel.text = self.playlistsModel[indexPath.row];

    return cell;
}


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

// This method provides a hook when moving to a new view controller in a storyboard
// It allows you to customize the transition or pass data to the destination view controller
// In our case we'll pass the name of the playlist that was selected
// In a proper app this would most likely be an id that the playlistViewController would use
// to grab the actually contents of the playlist, e.g. from a local db
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  PlaylistViewController *playlistViewController = segue.destinationViewController;
  NSString *currentPlaylist = self.playlistsModel[self.tableView.indexPathForSelectedRow.row];
  playlistViewController.playlistName = currentPlaylist;
}

// This method could load the model from disk, from the network or the model could get passed in to the class
// when it's created. In this simple example we'll just use a static array as our model
- (NSArray *)loadModel {
  NSArray *somePlaylists = @[
                     @"Top hits!",
                     @"Rock",
                     @"Blues",
                     @"Country",
                     @"Billboard",
                     @"Party musice",
                     @"My best music",
                     @"My worst music"
                     ];
  NSMutableArray *model = [NSMutableArray arrayWithArray:somePlaylists];
  for (int i=0; i<100; i++) {
    [model addObject:[NSString stringWithFormat:@"Playlist %d", i]];
  }

  return model;
}

@end
