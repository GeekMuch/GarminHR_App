using Toybox.Application as App;
using Toybox.System;
using Toybox.Communications;

const URL = "https://api.etherscan.io/api?module=account&action=balancemulti&address=0xAB8d28F89Fd9500540F841474c5000eb8eCBE80F&tag=latest&apikey=5EHZ8GQET5EPKA66EZQ6ANTIYH9SU14SUW/";

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
        return [ new Test_hrView("Starting " + URL) ];
        //return [ new Test_hrView() ];
    }
       // set up the response callback function

   	function onReceive(responseCode, data) {
   		System.println("[****]");
   		System.println(data);
      	WatchUi.switchToView(new Test_hrView("onReceive: " + URL + "\n" + responseCode + " " + data), null, WatchUi.SLIDE_IMMEDIATE);
   	}

   	function makeRequest() {
       var url = URL;
       var params = null;
       var options = {
         :method => Communications.HTTP_REQUEST_METHOD_GET,
         //:headers => { "Content-Type" => Communications.REQUEST_CONTENT_TYPE_URL_ENCODED},
         :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
       };
       var responseCallback = method(:onReceive);

       Communications.makeWebRequest(url, params, options, responseCallback);
  }



}
