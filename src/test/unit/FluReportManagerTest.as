package test.unit
{
	import flexunit.framework.TestCase;
	
	import managers.FluReportManager;
	
	import models.FluReport;

	public class FluReportManagerTest extends TestCase
	{
		private var fluReportManager : managers.FluReportManager;
		
		public var mockFluReportString:String = " <flu-report>" + 
				"<confirmed type=\"\">48159</confirmed>" + 
				"<created-at type=\"datetime\">2009-09-05T12:45:01Z</created-at>" + 
				"<fatal type=\"integer\">314</fatal>" + 
				"<id type=\"integer\">6</id>" + 
				"<report-date type=\"date\">2009-07-27</report-date>" + 
				"<suspected type=\"integer\">1059</suspected>" + 
				"<total-cases type=\"integer\" nil=\"true\"></total-cases>" + 
				"<updated-at type=\"datetime\">2009-09-05T12:45:01Z</updated-at>" + 
				"</flu-report>";
		
		public var mockFluReport:XML;
		public var fluReport:FluReport;
		
		public function FluReportManagerTest(methodName:String=null)
		{
			//TODO: implement function
			super(methodName);
			fluReportManager = new FluReportManager();
			mockFluReport = new XML(mockFluReportString);
			fluReport = fluReportManager.processFluReport(mockFluReport);
		}
		
		//This method will be called before every test function
		override public function setUp():void
		{
			//TODO: implement function
			super.setUp();
		}
		
		//This method will be called after every test function
		override public function tearDown():void
		{
			//TODO: implement function
			super.tearDown();
		}

		
		public function testAccessOfXMLProperties():void
		{
			var confirmed:Number = Number(mockFluReport.confirmed);
			var fatal:Number = Number(mockFluReport.fatal);
			var suspected:Number = Number(mockFluReport.suspected);

			assertEquals('numbers should be equal', confirmed, 48159);
			assertEquals('numbers should be equal', fatal, 314);
			assertEquals('numbers should be equal', suspected, 1059);

			var year:String;
			var month:String;
			var day:String;
			var reportDateAsString:String = mockFluReport["report-date"];
			year = reportDateAsString.substr(0,4);
			month = reportDateAsString.substr(5,2);
			day = reportDateAsString.substr(8,2);

			assertEquals("strings should match", '2009-07-27', reportDateAsString);
			assertEquals('strings should match', '2009', year);
			assertEquals('strings should match', '07', month);
			assertEquals('strings should match', '27', day);
		}
		
		public function testProcessFluReport():void
		{
			assertEquals('confimred values should match', 
				48159, fluReport.confirmed);
			var controlDate:Date = new Date(2009, 07, 27);
			assertEquals('date values should match', 
				controlDate.valueOf(), fluReport.projectDate.valueOf() );
			assertEquals('fatal values should match',
				314, fluReport.fatal);
			assertEquals('suspected values should match',
				1059, fluReport.suspected);
			assertEquals('id should match', 			
				6, fluReport.id);	
			//fluReportManager.fluReports.addItem(fluReport);
		}
		
		public function testStringToDate():void
		{
			var dateString:String = '2009-07-27';
			var testDate:Date = fluReportManager.stringToDate(dateString);
			var controlDate:Date = new Date(2009, 07, 27);
			assertEquals('date values should be equal',controlDate.valueOf(), testDate.valueOf() );
		}
		
		public function testParseXML():void
		{
			fail('not yet implemented');
		}
	}
}