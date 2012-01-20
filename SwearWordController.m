//
//  SwearWordController.m
//  SwearWordGenerator
//
//  Created by Moe on 08.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SwearWordController.h"

@implementation SwearWordController



- (IBAction)pushGenerieren:(NSButton *)sender {
	
	int zuffalszahl1 = (arc4random()%([zeilenDatei1 count]));
	int zuffalszahl2 = (arc4random()%([zeilenDatei2 count]));
	
	[SliderRegulator1 setFloatValue:zuffalszahl1];
	[SliderRegulator2 setFloatValue:zuffalszahl2];
	
	[Schimpfwort1 setStringValue:[zeilenDatei1 objectAtIndex:zuffalszahl1]];
	[Schimpfwort2 setStringValue:[zeilenDatei2 objectAtIndex:zuffalszahl2]];
	
	NSString *GeneriertesWort = [NSString stringWithFormat:@"%@%@", [Schimpfwort1 stringValue], [Schimpfwort2 stringValue]];	
	[SwearWord setStringValue:GeneriertesWort];
    
}

- (IBAction)pushLaden1:(NSButton *)sender {
	
	NSOpenPanel *OpenPanel = [NSOpenPanel openPanel];
	[OpenPanel setTitle:@"Swear Word 1 Laden"];
	[OpenPanel setPrompt:@"Laden"];
	[OpenPanel setRequiredFileType:@"txt"];
	
	if ([OpenPanel runModal] == NSOKButton) {
				
		// zeilenweise in array laden
		datei1=[NSString stringWithContentsOfFile:[OpenPanel filename] encoding:NSUTF8StringEncoding error:nil];
		zeilenDatei1=[datei1 componentsSeparatedByString:@"\n"];
		
		[SliderRegulator1 setEnabled:YES];		
		
		[SliderRegulator1 setMaxValue:[zeilenDatei1 count]-1];
		[SliderRegulator1 setNumberOfTickMarks:[zeilenDatei1 count]];
		
		[SliderRegulator1 setFloatValue:0];
		
		[self slideRegulator1:nil];
		
		// objekte im speicher belassen
		[datei1 retain];
		[zeilenDatei1 retain];
		
	}
	
	if ([SliderRegulator1 isEnabled] == YES && [SliderRegulator2 isEnabled] == YES) {
		[SwearWordButton setEnabled:YES];
		[self pushGenerieren:nil];
	}
	
		
	
}

- (IBAction)pushLaden2:(NSButton *)sender {
	
	NSOpenPanel *OpenPanel = [NSOpenPanel openPanel];
	[OpenPanel setTitle:@"Swear Word 2 Laden"];
	[OpenPanel setPrompt:@"Laden"];
	[OpenPanel setRequiredFileType:@"txt"];
	
	if ([OpenPanel runModal] == NSOKButton) {

	// zeilenweise in array laden
	datei2=[NSString stringWithContentsOfFile:[OpenPanel filename] encoding:NSUTF8StringEncoding error:nil];
	zeilenDatei2=[datei2 componentsSeparatedByString:@"\n"];
	
	[SliderRegulator2 setEnabled:YES];
	
	
	[SliderRegulator2 setMaxValue:[zeilenDatei2 count]-1];
	[SliderRegulator2 setNumberOfTickMarks:[zeilenDatei2 count]];
		
		[SliderRegulator2 setFloatValue:0];
		
	[self slideRegulator2:nil];
	
	// objekte im speicher belassen
	[datei2 retain];
	[zeilenDatei2 retain];
		
	}
	
	
	if ([SliderRegulator1 isEnabled] == YES && [SliderRegulator2 isEnabled] == YES) {
		[SwearWordButton setEnabled:YES];
		[self pushGenerieren:nil];
	}
	
	
    
}


- (IBAction)slideRegulator1:(NSSlider *)sender {	

[Schimpfwort1 setStringValue:[zeilenDatei1 objectAtIndex:[SliderRegulator1 intValue]]];
	
	NSString *GeneriertesWort = [NSString stringWithFormat:@"%@%@", [Schimpfwort1 stringValue], [Schimpfwort2 stringValue]];	
	[SwearWord setStringValue:GeneriertesWort];

	
}

- (IBAction)slideRegulator2:(NSSlider *)sender {
	
	[Schimpfwort2 setStringValue:[zeilenDatei2 objectAtIndex:[SliderRegulator2 intValue]]];
	
	NSString *GeneriertesWort = [NSString stringWithFormat:@"%@%@", [Schimpfwort1 stringValue], [Schimpfwort2 stringValue]];	
	[SwearWord setStringValue:GeneriertesWort];
}	
@end
