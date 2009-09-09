
/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - Flu_reporter.as.
 */
package services.flu_reporter
{
import mx.rpc.AsyncToken;
import fr.core.model_internal;
import mx.rpc.AbstractOperation;
import fr.services.wrapper.HTTPServiceWrapper;
import mx.rpc.http.HTTPMultiService;
import mx.rpc.http.Operation;
[ExcludeClass]
internal class _Super_Flu_reporter extends HTTPServiceWrapper
{      
       
    // Constructor
    public function _Super_Flu_reporter()
    {
        // initialize service control
        _serviceControl = new HTTPMultiService(); 
         var operations:Array = new Array();
         var operation:Operation;  
         var argsArray:Array;       
         
         operation = new Operation(null, "index");
         operation.url = "http://localhost:3000/flu_report";
         operation.method = "GET";
		 operation.resultType = Object; 		 
         operations.push(operation);
    
         _serviceControl.operationList = operations;  

    
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'index' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function index() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("index");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   

}

}
