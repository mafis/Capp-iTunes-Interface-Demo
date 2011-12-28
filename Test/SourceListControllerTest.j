@implementation SomeTest : OJTestCase
{
  var  sourceListController;
}

- (void)setUp
{
  sourceListController = [[SourceListController alloc] init];
}

- (void)tearDown
{
  [target cleanUp];
}

- (void)testSomething
{
	[self assertFalse:YES];
	
	var expected =10;
	var actual = [sourceListController numberOfRowsInTableView:stub()];
	[sourceListController assert:expected equals:actual];
		
}

@end