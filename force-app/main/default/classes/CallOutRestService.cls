public with sharing class CallOutRestService {
    public static void getResponse() {
        HttpRequest newRequest = new HttpRequest();
        newRequest.setEndPoint('https://api.coindesk.com/v1/bpi/currentprice.json');
        newRequest.setMethod('GET');
        Http h = new Http();
        HttpResponse  newResponse = h.send(newRequest);
        if(newResponse.getStatusCode() == 200 ) {
            Map<String, Object> data = (Map<String, Object>)JSON.deserializeUntyped(newResponse.getBody());
            //System.debug(data);
            Map<String, Object> actualData = (Map<String, Object>)data.get('bpi');
            System.debug(actualData);
        }
    }
}