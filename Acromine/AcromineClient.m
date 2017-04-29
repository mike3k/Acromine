//
//  AcromineClient.m
//  Acromine
//
//  Created by Mike Cohen on 4/28/17.
//  Copyright © 2017 Mike Cohen. All rights reserved.
//

#import "AcromineClient.h"

@implementation AcromineClient

+ (AcromineClient*)shared {
    static NSString *_urlString = @"http://www.nactem.ac.uk/software/acromine/";
    static AcromineClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AcromineClient alloc] initWithBaseURL:[NSURL URLWithString:_urlString]];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    });
    return _sharedClient;
}

- (void)getDefinitions:(NSString*)abbreviation
            completion:(void (^)(id _Nullable results, NSError *_Nullable error))completion {
    if (abbreviation.length == 0) {
        completion(nil,[NSError errorWithDomain:NSCocoaErrorDomain code:12345 userInfo:@{@"description": @"abbreviation must not be empty"}]);
        return;
    }
    [self GET:@"dictionary.py" parameters:@{@"sf": abbreviation} progress:^(NSProgress * _Nonnull downloadProgress) {
        // progress
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // success
        completion(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // fail
        completion(nil,error);
    }];
    
}

@end
