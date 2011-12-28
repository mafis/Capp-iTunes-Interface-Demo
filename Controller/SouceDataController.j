@import "../View/DataCollectionView.j"

@implementation SourceDataController : CPObject
{
	@outlet CPCollectionView dataCollectionView;
}

-(void)awakeFromCib
{
	[dataCollectionView setAutoresizingMask:CPViewWidthSizable];
	[dataCollectionView setMinItemSize:CGSizeMake(100, 100)];
	[dataCollectionView setMaxItemSize:CGSizeMake(100, 100)];
	[self setType:0];
}

-(void)setType:(int)type
{
	
	var data = nil;
	
	switch(type){
		case 0:
			data = ["Snippet 1","Snippet 2"];
			break;
		case 1:
			data = ["Frameworks 1","Frameworks 2"];
			break;
		case 2:
			data = ["Tutorials 1","Tutorials 2"];
			break;
		default:
			break;
		
	}
	
	
	[dataCollectionView setContent:data];
	
}


@end
