//
//  SearchDetailsViewController.m
//  WikipediaSearch
//
//  Created by Craig on 5/16/13.
//  Copyright (c) 2013 craigeryp. All rights reserved.
//

#import "SearchDetailsViewController.h"

@interface SearchDetailsViewController ()

@property (strong, nonatomic) IBOutlet UITextView *snippetTextField;
@property (strong, nonatomic) IBOutlet UILabel *searchTitleLabel;

@end

@implementation SearchDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.snippetTextField.text = self.wikiSearchObject.snippet;
    self.searchTitleLabel.text = self.wikiSearchObject.title;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
