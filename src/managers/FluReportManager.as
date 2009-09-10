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
			for each(var report:XML in xml.children())
			{
				//cache this in the manager to get data later without a service call
				var tempFluReport:FluReport = processFluReport(report);
				fluReports.addItem(tempFluReport);
			}
			return fluReports;
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
		
		/**
		 * iterates thought the internal fluReports array collection to
		 * find a report by id
		 * 
		 */
		public function findReportById(id:int):FluReport
		{
			var fr:FluReport;
			for each(var report:FluReport in fluReports)
			{
				if (report.id == id )
				{
					fr = report
					return fr;
				}
				else fr = new FluReport();
			}
			return fr;
		}
		
		/**
		 * returns a new flu report that is the diff between two existing reports
		 * fluReport1 is considered the newest report
		 */
		public function diffFluReports(report1:FluReport, report2:FluReport):FluReport
		{
			var report:FluReport = new FluReport();
			report.confirmed = report1.confirmed - report2.confirmed;
			report.suspected = report1.suspected - report2.suspected;
			report.fatal = report1.fatal - report2.fatal;
			return report;
		}
		
	}
}