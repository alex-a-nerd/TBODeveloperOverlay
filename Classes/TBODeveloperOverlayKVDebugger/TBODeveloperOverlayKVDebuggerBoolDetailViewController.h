//
//  TBODeveloperOverlayKVDebuggerBoolDetailViewController.h
//  TBODeveloperOverlay
//
//  Created by Bernhard Eiling on 08.07.16.
//  Copyright © 2016 TBO INTERACTIVE. All rights reserved.
//

#import "TBODeveloperOverlayKVDebuggerBaseDetailViewController.h"

@interface TBODeveloperOverlayKVDebuggerBoolDetailViewController : TBODeveloperOverlayKVDebuggerBaseDetailViewController

- (instancetype)initWithBool:(BOOL)boolean title:(NSString *)title description:(NSString *)description andEditingBlock:(void (^)(id))editingBlock;

@end
