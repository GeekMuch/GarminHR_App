using Toybox.Application as App;
using Toybox.System;
using Toybox.Communications;
using Toybox.Math;

const URL = "https://api.etherscan.io/api?module=account&action=balancemulti&address=0xAB8d28F89Fd9500540F841474c5000eb8eCBE80F&tag=latest&apikey=5EHZ8GQET5EPKA66EZQ6ANTIYH9SU14SUW/";

var eth_balance;
var num;
var num2;

class Test_hrApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    	makeRequest();
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    /*function onShow() {
    }*/

    function onMenu() {
    }


    // Return the initial view of your application here
    function getInitialView() {
        return [ new Test_hrView("[+] Starting => " + URL) ];
        //return [ new Test_hrView() ];
    }
       // set up the response callback function

   	function onReceive(responseCode, data) {
      	//WatchUi.switchToView(new Test_hrView("[+] onReceive: " + URL + "\n[+]" + responseCode + " " + data), null, WatchUi.SLIDE_IMMEDIATE);
      	WatchUi.switchToView(new Test_hrView(data.get("result")[0].get("balance")), null, WatchUi.SLIDE_IMMEDIATE);
		procesDataFromJson(data);
   		printData(data);
   	}
   	
   	function procesDataFromJson(data){
   		num = data.get("result")[0].get("balance"); 
   		num2 = (num.toFloat() / Math.pow(10, 18)).toString() ;
   		eth_balance = num2 ;
   	
   	}
   	
   	function printData(data){
   		System.println("\n[+] Balance in Eth => " + data.get("result")[0].get("balance") + "\n[+] From wallet => " + data.get("result")[0].get("account"));
   		num = data.get("result")[0].get("balance"); 		
   		System.println("\n[+] Eth Balance => " + eth_balance);
   	}

   	function makeRequest() {
       var url = URL;
       var params = null;
       var options = {
         :method => Communications.HTTP_REQUEST_METHOD_GET,
         
         :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
       };
       var responseCallback = method(:onReceive);

       Communications.makeWebRequest(url, params, options, responseCallback);
  }


	
}
