//
//  TransitionCell.h
//  CubeTransition
//
//  Created by Nikita Kovalenok on 21.12.16.
//  Copyright © 2016 NikKovIos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayerView.h"

#define degToRad(x) (M_PI * x / 180.0)
#define RadToDeg(x) (180.0 * x / M_PI )

@protocol CellDelegateProtocol

- (void)firstButtonTap;
- (void)secondButtonTap;

@end


@interface TransitionCell : UITableViewCell
//{
//    BOOL  _front;
//    float _duration;
//    float _perspective;
//    
//    UIImageView *_firstViewImageView;
//    UIImageView *_secondViewImageView;
//}

@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
//@property (weak, nonatomic) IBOutlet LayerView *transformLayer;
@property (weak, nonatomic) id<CellDelegateProtocol> cellDelegate;

@end
