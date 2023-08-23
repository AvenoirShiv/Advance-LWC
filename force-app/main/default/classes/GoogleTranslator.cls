public class GoogleTranslator {
    public static String doTranslate(string textBody,string sourceLang,string targetLang ){
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setEndpoint('https://google-translate1.p.rapidapi.com/language/translate/v2');
        req.setMethod('POST');
        // Your api key here
        req.setHeader('X-RapidAPI-Key', '12c1920b6dmsh66df59207cab8cap1a9c4ejsnd4b7a1a1f10e');
        req.setHeader('X-RapidAPI-Host', 'google-translate1.p.rapidapi.com');
        req.setHeader('content-type', 'application/x-www-form-urlencoded');
        String body = 'q='+textBody+'&source='+sourceLang+'&target='+targetLang;
        req.setBody(body);
        res = http.send(req);
        Map<string, object> responseMap = (Map<string, object>) JSON.deserializeUntyped(res.getbody());
        Map<string, object>  data = (Map<string, object>) responseMap.get('data');
		//System.debug('asxas' + responseMap);
        Map<string, object> translations = (Map<string, object>)((List<object>) data.get('translations'))[0];
        return (string) translations.get('translatedText');
    }
}