//
//  main.m
//  XCodeNSUserDefaultsBug
//
//  Created by idz on 1/25/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * In the Xcode scheme for this test program we set
 * -expectedResult expectedResult
 * -expectedResult2 expectedResult2
 */
int main(int argc, const char * argv[]) {
    int exitStatus = EXIT_SUCCESS;
    @autoreleasepool {
        /* dump argv */
        for(int iArg = 0; iArg < argc; ++iArg)
        {
            NSLog(@"argv[%d]: %s", iArg, argv[iArg]);
        }
        if(strcmp(argv[1], "-expectedResult") != 0)
        {
            NSLog(@"FAIL: argv[1] should be '-expectedResult', got '%s'", argv[1]);
            exitStatus = EXIT_FAILURE;
        }
        
        /* dump NSDefaults */
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *defaultsDictionary = [defaults volatileDomainForName:NSArgumentDomain];
        NSLog(@"defaultsDictionary = %@", defaultsDictionary);
        NSString *expectedResult = [defaults stringForKey:@"expctedResult"];
        if(![expectedResult isEqualToString:@"expectedResult"])
        {
            NSLog(@"FAIL: [defaults stringForKey:@\"expctedResult\"] should be 'expectedResult', got '%@'", expectedResult);
            exitStatus = EXIT_FAILURE;
        }
    }
    return exitStatus;
}
