using Toybox.Application as App;
using Toybox.System;
using Toybox.Communications;
using Toybox.Math;
using Toybox.Timer;


    // Get coin balace through etherscan API
//const URL_ETH = "https://api.etherscan.io/api?module=account&action=balancemulti&address=0xAB8d28F89Fd9500540F841474c5000eb8eCBE80F&tag=latest&apikey=5EHZ8GQET5EPKA66EZQ6ANTIYH9SU14SUW/";

var  urlArray = ["https://api.coinmarketcap.com/v1/ticker/bitcoin/","https://api.coinmarketcap.com/v1/ticker/ethereum/","https://api.coinmarketcap.com/v1/ticker/litecoin/"];

var balance = [];
var balance_name = [];
var eth_balance;
var num;
var num2;
var recv = 1;
var BTC_v;
var ETH_v;
var LTC_v;


 //Main SuperClass
 
class Test_hrApp extends App.AppBase {

   function initialize() {
        AppBase.initialize();
        
   }

    // onStart() is called on application start up
   function onStart(state) {
        whileUrlSizeMakeRequest();
        
        
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
        return [ new Test_hrView("\n[+] Start Initial Veiw") ];

    }
       
    // set up the response callback function
    function onReceive(responseCode, data) {
        WatchUi.switchToView(new Test_hrView("[+] ReceiveNo: " + recv + " " + urlArray  + "\n    Recv. code: " + responseCode + " data received \n" ), null, WatchUi.SLIDE_IMMEDIATE);
        balance.add(data[0].get("price_usd") + "$" );
        balance_name.add(data[0].get("id"));
        System.println("[+] Balance => " + balance + "\n");
        recv += 1;
        PrintBalance();
        //printData(data);
        
    }
  
    function PrintBalance(){
        if(recv == 4){
            
            System.println("Balances " + balance + "\n");
            System.println("ID " + balance_name + "\n");
            setViewData();
        }
    }
    
    function setViewData(){
        BTC_v = balance[0];
        ETH_v = balance[1];
        LTC_v = balance[2];
        System.println("Balance BTC " + balance[0] + " BTC_value: " + BTC_v);
        System.println("Balance ETH " + balance[1]);
    }
        
    function printData(data){
        //System.println("[+] Price => " + balance + "\n");
        //System.println("data: " + data);
        //num = data.get("result")[0].get("balance");       
        //System.println("\n[+] Eth Balance => " + eth_balance);
    }
    
    
    function whileUrlSizeMakeRequest() {
        for( var i = 0; i < urlArray.size(); i++ ){
            var url = urlArray[i];
            var params = null;
            var options = {
                :method => Communications.HTTP_REQUEST_METHOD_GET,
                :headers => { "Content-Type" => Communications.REQUEST_CONTENT_TYPE_JSON}, 
                :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
                };
            var responseCallback = method(:onReceive);
            
            
            Communications.makeWebRequest(url, params, options, responseCallback);
        }
        
    }     


    
}
