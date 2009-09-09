package models
{
	/**
	 * basic class for casting xml data in to primitives 
	 */
	public class FluReport
	{
		private var _confirmed:Number;
		private var _suspected:Number;
		private var _fatal:Number;
		private var _id:int;
		private var _projectDate:Date;
		
		
		public function FluReport()
		{
		}
		
		public function get confirmed():Number
		{
			return _confirmed;
		}
		
		public function set confirmed(n:Number):void
		{
			_confirmed = n;
		}
		
		public function get suspected():Number
		{
			return _suspected;
		}
		
		public function set suspected(n:Number):void
		{
			_suspected = n;
		}
		
		public function get fatal():Number
		{
			return _fatal;
		}
		
		public function set fatal(n:Number):void
		{
			_fatal = n;
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function set id(x:int):void
		{
			_id = x;
		}
		
		public function get projectDate():Date
		{
			return _projectDate;
		}
		
		public function set projectDate(d:Date):void
		{
			_projectDate = d;
		}
	}
}