//
//  Copyright (c) 2013 Luke Scott
//  https://github.com/lukescott/DraggableCollectionView
//  Distributed under MIT license
//

#import "DraggableCollectionViewFlowLayout.h"
#import "LSCollectionViewLayoutHelper.h"

@interface DraggableCollectionViewFlowLayout ()
{
    LSCollectionViewLayoutHelper *_layoutHelper;
}
@end

@implementation DraggableCollectionViewFlowLayout

- (LSCollectionViewLayoutHelper *)layoutHelper
{
    if(_layoutHelper == nil) {
        _layoutHelper = [[LSCollectionViewLayoutHelper alloc] initWithCollectionViewLayout:self];
    }
    return _layoutHelper;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *superArray = [super layoutAttributesForElementsInRect:rect];
    if(superArray == nil) return nil;
    
    NSArray *copyArray = [[NSArray alloc] initWithArray:superArray copyItems:YES];
    
    return [self.layoutHelper modifiedLayoutAttributesForElements:copyArray];
}

@end
