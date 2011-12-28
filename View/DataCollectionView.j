@implementation DataCollectionView : CPView
{
	CPTextField _label;
	CPImageView _imageView;
}

- (void)setRepresentedObject:(id)anObject
{
    if (!_label)
    {
        var textFrame = CGRectInset([self bounds], 0, 80);
        
        _label = [[CPTextField alloc] initWithFrame:textFrame];
        [self addSubview:_label];

    }
	
	if(!_imageView)
	{
		var imageFrame = CGRectMake(10,0, 80, 80);
        
		_imageView = [[CPImageView alloc] initWithFrame:imageFrame];
		var mainBundle = [CPBundle mainBundle];

		var path = [mainBundle pathForResource:@"snippet.png"];
		image1 = [[CPImage alloc] initWithContentsOfFile:path];
		[_imageView setImage:image1];
		[self addSubview:_imageView];
	}
	
	[_label setStringValue:anObject];
    
}

- (void)setSelected:(BOOL)isSelected
{
    [self setBackgroundColor:isSelected ? [CPColor grayColor] : nil];
}

@end