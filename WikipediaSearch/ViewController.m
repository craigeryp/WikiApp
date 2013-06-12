//
//  ViewController.m
//  WikipediaSearch
//
//  Created by Craig on 5/16/13.
//  Copyright (c) 2013 craigeryp. All rights reserved.
//

#import "ViewController.h"
#import "WikiSearchObject.h"
#import "SearchDetailsViewController.h"

@interface ViewController () 

@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) NSMutableArray *searchResultsArray;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;


- (IBAction)searchButton:(id)sender;




@end

@implementation ViewController
@synthesize searchTextField;





- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.searchResultsArray = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButton:(id)sender {
    
    NSString *searchField = searchTextField.text;
    NSString *wikipediaURL = [NSString stringWithFormat:@"https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=%@&srprop=snippet&format=json", searchField]; 
    
    NSURL *url = [NSURL URLWithString:wikipediaURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    
    
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *urlResponse, NSData *data, NSError *error) {
                              
                               //stop activity indicator
                               
                               
                               
                               NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                               NSDictionary *queryDictionary =  [responseDictionary objectForKey:@"query"];
                               NSArray *searchResults = [queryDictionary objectForKey:@"search"];
                               
                               
                
                               for (NSDictionary *result in searchResults) {
                                   NSString *title = [result objectForKey:@"title"];
                                   NSString *snippet = [result objectForKey:@"snippet"];
                                  
                                   WikiSearchObject *wikiSearchObject = [WikiSearchObject WikiSearchObjectWithTitle:title andSnippet:snippet];
                                   
                                   
                                   
                                   [self.searchResultsArray addObject:wikiSearchObject];
                               }
                               
                               [self.tableView reloadData];
                               
                           }];
    
    
    
    
    
}



#pragma tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.searchResultsArray count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"searchResult";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    cell.accessoryType = UIButtonTypeRoundedRect;
    
    
    //this is what name the cell, has to have a location
   WikiSearchObject *wikiSearchObject = ((WikiSearchObject *)self.searchResultsArray[indexPath.row]);
    cell.textLabel.text  = wikiSearchObject.title;
        
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SearchDetailsViewController *searchDetailsVC = (SearchDetailsViewController *) segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    searchDetailsVC.wikiSearchObject = ((WikiSearchObject *)self.searchResultsArray[indexPath.row]);
    

   // what does this mean?????  indexPathsForSelectedRows = indexPath;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//   // self.selectedIndexPath = indexPath;
//    [self performSegueWithIdentifier:@"resultsToDetails" sender:self];
//}






@end
