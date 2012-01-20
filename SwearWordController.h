//
//  SwearWordController.h
//  SwearWordGenerator
//
//  Created by Moe on 08.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SwearWordController : NSObject {
    IBOutlet id Schimpfwort1;
    IBOutlet id Schimpfwort2;
	IBOutlet id SliderRegulator1;
	IBOutlet id SliderRegulator2;
    IBOutlet id SwearWord;
	IBOutlet NSButton * SwearWordButton;
	
	NSString *datei1;
	NSArray *zeilenDatei1;	
	
	NSString *datei2;
	NSArray *zeilenDatei2;	
}
	

- (IBAction)pushGenerieren:(NSButton *)sender;
- (IBAction)pushLaden1:(NSButton *)sender;
- (IBAction)pushLaden2:(NSButton *)sender;
- (IBAction)slideRegulator1:(NSSlider *)sender;
- (IBAction)slideRegulator2:(NSSlider *)sender;

@end
