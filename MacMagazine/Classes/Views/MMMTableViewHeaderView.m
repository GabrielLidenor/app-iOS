#import <PureLayout/PureLayout.h>

#import "MMMTableViewHeaderView.h"
#import "HexColor.h"

#pragma mark MMMTableViewHeaderView

@implementation MMMTableViewHeaderView

#pragma mark - Class Methods

+ (NSString *)identifier {
    return NSStringFromClass(self);
}

+ (CGFloat)height {
    NSDictionary *textAttributes = @{NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1]};
    CGRect boundingRect = [@"TODAY" boundingRectWithSize:CGSizeMake(300, INT_MAX)
                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                              attributes:textAttributes
                                                 context:nil];
    return CGRectGetHeight(boundingRect) + 18;
}

#pragma mark - Instance Methods

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (!self) {
        return nil;
    }
    
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.backgroundView = visualEffectView;
    [visualEffectView autoPinEdgesToSuperviewEdges];
    
    _titleLabel = [MMMLabel new];
    _titleLabel.numberOfLines = 1;
	_titleLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textStyle = UIFontTextStyleCaption1;
    _titleLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    self.textLabel.hidden = YES;
    self.detailTextLabel.hidden = YES;
    
    return self;
}

@end
