package managers
{
	import models.FluReport;
	
	import mx.collections.ArrayCollection;

	public class FluReportManager
	{
		public var fluReports:ArrayCollection;
		
		
		public function FluReportManager()
		{
			fluReports = new ArrayCollection();
		}
		
		public function parseXML(xml:XML):ArrayCollection
		{
			var ac:ArrayCollection = new ArrayCollection();
			
			for each(var report:XML in xml.children())
			{
				var tempFluReport:FluReport = processFluReport(report);
				ac.addItem(tempFluReport);
			}
			return ac;
		}
		
		/**
		 * processes a single xml instance
		 */
		public function processFluReport(xml:XML):FluReport
		{
			var fluReport:FluReport = new FluReport();
			fluReport.confirmed = Number(xml.confirmed);
			fluReport.fatal = Number(xml.fatal);
			fluReport.suspected = Number(xml.suspected);
			fluReport.id = int(xml.id);
			fluReport.projectDate = stringToDate(xml['report-date']);
			return fluReport;
		}
		
		/**
		 * converts strings to dates
		 */
		public function stringToDate(s:String):Date
		{
			var year:Number = Number( s.substr(0,4) );
			var month:Number = Number( s.substr(5,2) )-1;
			var day:Number = Number( s.substr(8,2) );
			var d:Date = new Date(year, month, day);
			
			return d;
		}
		
	}
}