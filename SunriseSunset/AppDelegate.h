//
//  AppDelegate.h
//  SunriseSunset
//
//  Created by user on 27.09.18.
//  Copyright © 2018 Chorniak inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate> {
    CLLocationManager* locationManager;
    CLGeocoder* geocoder;
    CLPlacemark* placemark;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager* locationManager;

@end

