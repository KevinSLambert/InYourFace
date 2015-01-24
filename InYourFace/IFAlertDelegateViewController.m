//
//  IFAlertDelegateViewController.m
//  InYourFace
//
//  Created by Kevin Lambert on 1/22/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "IFAlertDelegateViewController.h"

@interface IFAlertDelegateViewController ()

@end

@implementation IFAlertDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self presentAlertViewController];
    [self gameAlertViewController];
}

-(void)gameAlertViewController {
    
    UIAlertController *gameController = [UIAlertController alertControllerWithTitle:@"Find the Queen" message:@"You can ONLY pick one." preferredStyle:UIAlertControllerStyleAlert];
    
    [gameController addAction:[UIAlertAction actionWithTitle:@"?????" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self loseAlertViewController];
    }]];
    
    [gameController addAction:[UIAlertAction actionWithTitle:@"?????" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self loseAlertViewController];
    }]];
    
    [gameController addAction:[UIAlertAction actionWithTitle:@"?????" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self winAlertViewController];
    }]];
    
    [self presentViewController:gameController animated:YES completion:nil];
    
}

-(void)winAlertViewController {
    
    UIAlertController *winController = [UIAlertController alertControllerWithTitle:@"YOU WIN!!!" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [winController addAction:[UIAlertAction actionWithTitle:@"Play Again?" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self gameAlertViewController];
    }]];
    
    [self presentViewController:winController animated:YES completion:nil];
    
}

-(void)loseAlertViewController {
    
    UIAlertController *loseController = [UIAlertController alertControllerWithTitle:@"You Lost" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [loseController addAction:[UIAlertAction actionWithTitle:@"Play Again?" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self gameAlertViewController];
    }]];
    
    [self presentViewController:loseController animated:YES completion:nil];
    
}


-(void)presentAlertViewController {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[self randomTitle] message:@"You have only two options" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Never Again" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"I'm Sorry, I'll never do it again.");
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Hit me!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self presentAlertViewController];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (NSString *)randomTitle {
    
    int index = arc4random_uniform([self lines].count);
    return [self lines][index];
    
}


- (NSArray *)lines {
    
    return @[@"If peeing is cool, consider me Miles Davis",
             @"We don't need no stinking badges",
             @"Thank you very little",
             @"You can't fight in here. This is a war room.",
             @"There's no crying in baseball",
             @"I have nipples, greg. Could you milk me?",
             @"You could be drinking whole, if you wanted to.",
             @"Fat guy in a little coat",
             @"How can we be expected to teach children how to read if they can't even fit inside the building?"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
