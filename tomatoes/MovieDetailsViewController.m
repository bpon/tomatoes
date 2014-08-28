//
//  MovieDetailsViewController.m
//  tomatoes
//
//  Created by Bryan Pon on 8/20/14.
//  Copyright (c) 2014 Jab. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end

@implementation MovieDetailsViewController

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
    // Do any additional setup after loading the view from its nib.
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"synopsis"];
    //Download poster image
    NSString *largeImageUrl = [self.movie[@"posters"][@"original"] stringByReplacingOccurrencesOfString:@"_tmb" withString:@"_ori"];
    NSURL *imageUrl = [NSURL URLWithString:largeImageUrl];
    [self.posterView setImageWithURL:imageUrl];
    //Size scroll view
    [self.synopsisLabel sizeToFit];
    self.scroll.contentSize = CGSizeMake(320, self.synopsisLabel.frame.size.height + 100);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
