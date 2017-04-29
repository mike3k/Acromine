//
//  AcromineClient.h
//  Acromine
//
//  Created by Mike Cohen on 4/28/17.
//  Copyright © 2017 Mike Cohen. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AcromineClient : AFHTTPSessionManager

+ (AcromineClient*_Nonnull)shared;

- (void)getDefinitions:(NSString*_Nonnull)abbreviation
            completion:(void (^_Nonnull)(id _Nullable results, NSError *_Nullable error))completion;

@end
