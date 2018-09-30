//
//  ViewController.m
//  SunriseSunset
//
//  Created by user on 27.09.18.
//  Copyright © 2018 Chorniak inc. All rights reserved.
//


#import "ViewController.h"
#import <GooglePlaces/GooglePlaces.h>
#import <CoreLocation/CoreLocation.h>
@import GooglePlaces;

@interface ViewController () <CLLocationManagerDelegate, GMSAutocompleteViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunriceLabal;
@property (weak, nonatomic) IBOutlet UILabel *sunsetLabal;
@property (weak, nonatomic) IBOutlet UISearchBar *manualSearch;
@property (nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation ViewController {
    
   GMSPlacesClient *_placesClient;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; 
    [self.locationManager startUpdatingLocation];

    _placesClient = [GMSPlacesClient sharedClient];
}

- (IBAction)onLaunchClicked:(id)sender {
    GMSAutocompleteViewController *acController = [[GMSAutocompleteViewController alloc] init];
    acController.delegate = self;
    [self presentViewController:acController animated:YES completion:nil];
}

- (void)viewController:(GMSAutocompleteViewController *)viewController
didAutocompleteWithPlace:(GMSPlace *)place {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"Place address %@", place.formattedAddress);
    
    NSString *manualLat = [NSString stringWithFormat:@"%f", place.coordinate.latitude];
    NSString *manualLong = [NSString stringWithFormat:@"%f", place.coordinate.longitude];
    
    [self getSunDataWithLat:manualLat andLongE:manualLong];
    
    self.nameLabel.text = place.formattedAddress;
    self.nameLabel.alpha = 1;
}

- (void)viewController:(GMSAutocompleteViewController *)viewController
didFailAutocompleteWithError:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"Error: %@", [error description]);
}

- (void)wasCancelled:(GMSAutocompleteViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didRequestAutocompletePredictions:(GMSAutocompleteViewController *)viewController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didUpdateAutocompletePredictions:(GMSAutocompleteViewController *)viewController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


-(void) getSunDataWithLat:(NSString*) lat andLongE:(NSString*) lng{
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.sunrise-sunset.org/json?lat=%@&lng=%@", lat, lng];
    NSData *data = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:urlString]];
    NSError *error;
    
    if (data) {
        NSData *jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSData *currentData = [jsonData valueForKey:@"results"];
        NSString *sunriseDate = [currentData valueForKey:@"sunrise"];
        NSString *sunsetDate = [currentData valueForKey:@"sunset"];
        
        self.sunriceLabal.text = sunriseDate;
        self.sunriceLabal.alpha = 1;
        self.sunsetLabal.text = sunsetDate;
        self.sunsetLabal.alpha = 1;
        
        NSLog(@"Sunrise %@  ::  Sunset %@", sunriseDate, sunsetDate);
        NSLog(@"Lat: %@      ::  Long: %@", lat, lng);
        
    } else {
        NSLog(@"ERROR %@", error);
    }
}

- (IBAction)getCurrentPlace:(UIButton *)sender {
    [_placesClient currentPlaceWithCallback:^(GMSPlaceLikelihoodList *placeLikelihoodList, NSError *error){
        if (error != nil) {
            NSLog(@"Location error %@", [error localizedDescription]);
            self.nameLabel.text = @"Location error";
            return;
        }
    
        if (placeLikelihoodList != nil) {
            GMSPlace *place = [[[placeLikelihoodList likelihoods] firstObject] place];
            if (place != nil) {
                self.nameLabel.text = place.formattedAddress;
                NSLog(@"Place adress %@", place.formattedAddress);
                self.nameLabel.alpha = 1;

                NSString *latCoordinat = [NSString stringWithFormat:@"%f", place.coordinate.latitude];
                NSString *longCoordinat = [NSString stringWithFormat:@"%f", place.coordinate.longitude];
                
                [self getSunDataWithLat:latCoordinat andLongE:longCoordinat];
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
