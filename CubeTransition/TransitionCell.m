//
//  TransitionCell.m
//  CubeTransition
//
//  Created by Nikita Kovalenok on 21.12.16.
//  Copyright © 2016 NikKovIos. All rights reserved.
//

#import "TransitionCell.h"

@implementation TransitionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
//    _front       = YES;
//    _duration    = 1.5;
//    _perspective = 100;
}

- (IBAction)firstViewButtonTouch:(id)sender {
    [self.cellDelegate firstButtonTap];
    
    [self switchToView:self.secondView];
}

- (IBAction)secondViewButtonTouch:(id)sender {
    [self.cellDelegate secondButtonTap];
    
    [self switchToView:self.firstView];
}

- (void)switchToView:(UIView *)view
{
    CATransition *animation = [CATransition animation];
    animation.duration = 1;
    animation.type = @"cube";
    animation.subtype = @"fromRight";
    [self.contentView.layer addAnimation:animation forKey:@"animation"];
    
    [self.contentView bringSubviewToFront:view];
}

//- (void)setupAnimation
//{
//    CATransform3D transformMatrix = CATransform3DIdentity;
//    transformMatrix.m42 = 1;
//    self.contentView.layer.sublayerTransform = transformMatrix;
//    
//    //
//    // child 1 - grab and draw view
//    //
//    UIGraphicsBeginImageContext(self.firstView.frame.size);
//    [self.firstView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *grab = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    if ( _firstViewImageView )
//        [_firstViewImageView removeFromSuperview];
//    _firstViewImageView = [[ UIImageView alloc ] initWithImage:grab];
//    [ self.transformLayer addSubview:_firstViewImageView ];
//    
//    //
//    // child 2 - grab and draw view
//    //
//    UIGraphicsBeginImageContext(self.secondView.frame.size);
//    [self.secondView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    grab = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    if ( _secondViewImageView )
//        [_secondViewImageView removeFromSuperview];
//    _secondViewImageView = [[ UIImageView alloc ] initWithImage:grab];
//    [ self.transformLayer addSubview:_secondViewImageView ];
//    
//    CGRect r = self.transformLayer.bounds;
//    _firstViewImageView.frame = r;
//    r.origin.y = r.size.height;
//    _secondViewImageView.frame = r;
//    
//    self.transformLayer.layer.anchorPointZ = -(r.size.height/2);
//    self.transformLayer.layer.zPosition    = -(r.size.height/2);
//    
//    //
//    // transform child-2 grabbed
//    //
//    CATransform3D trans = CATransform3DIdentity;
//    trans = CATransform3DRotate    ( trans, degToRad(-90), 1, 0, 0 );
//    trans = CATransform3DTranslate ( trans, 0, r.size.height/2, 0 );
//    trans = CATransform3DTranslate ( trans, 0, 0, -r.size.height/2 );
//    [ _secondViewImageView.layer setTransform: trans ];
//}
//
//- (void)switchViews
//{
//    [self setupAnimation];
//    
//    [self.firstView removeFromSuperview];
//    [self.secondView removeFromSuperview];
//    
//    [ UIView animateWithDuration: _duration animations: ^
//     {
//         CATransform3D trans = CATransform3DIdentity;
//         CGFloat degrees = _front ? 90 : 0;
//         trans = CATransform3DRotate ( trans, degToRad(degrees), 0, 1, 0 );
//         [self.transformLayer.layer setTransform:trans];
//     } completion:^(BOOL finished)
//     {
//         if (_front)
//         {
//             [_firstViewImageView removeFromSuperview];
//             [self.contentView addSubview:self.secondView];
//         }
//         else
//         {
//             [_secondViewImageView removeFromSuperview];
//             [self.contentView addSubview:self.firstView];
//         }
//         
//         _front = !_front;
//     }];
//}

@end
