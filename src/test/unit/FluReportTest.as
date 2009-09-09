package test.unit
{
	import flexunit.framework.TestCase;
	
	import models.FluReport;
	
	public class FluReportTest extends TestCase
	{
		// please note that all test methods should start with 'test' and should be public
		
		// Reference declaration for class to test
		private var fluReport : models.FluReport;
		
		public function FluReportTest(methodName:String=null)
		{
			//TODO: implement function
			super(methodName);
		}
		
		//This method will be called before every test function
		override public function setUp():void
		{
			//TODO: implement function
			super.setUp();
			fluReport = new FluReport();
		}
		
		//This method will be called after every test function
		override public function tearDown():void
		{
			//TODO: implement function
			super.tearDown();
		}
		
		public function testConfirmed():void
		{
			var confirmed:Number = 24;
			fluReport.confirmed = 24;
			assertEquals('numbers should be equal', confirmed, fluReport.confirmed);
		}
		
		public function testSuspected():void
		{
			var suspected:Number = 34;
			fluReport.suspected = 34;
			assertEquals('numbers should be equal', suspected, fluReport.suspected);
		}
		
		public function testFatal():void
		{
			var fatal:Number = 2;
			fluReport.fatal = 2;
			assertEquals('numbers should be equal', fatal, fluReport.fatal);
		}
		
		public function testId():void
		{
			var id:int = 3;
			fluReport.id = 3;
			assertEquals('id values should be equal', id, fluReport.id);
		}
		
		public function testProjectDate():void
		{
			var date:Date = new Date(2009, 07, 27);
			var dateString:String= '2009-07-27';
			var year:Number = Number( dateString.substr(0,4) );
			var month:Number = Number( dateString.substr(5,2) );
			var day:Number = Number( dateString.substr(8,2) );
			var otherDate:Date = new Date(year, month, day);
			
			assertEquals('dates values should be equal', date.valueOf(), otherDate.valueOf());
			fluReport.projectDate = otherDate;
			assertEquals('date should return from fluReport object', otherDate.valueOf(), fluReport.projectDate.valueOf() );
		}
		
	}
}