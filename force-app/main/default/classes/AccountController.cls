public class AccountController {
    @AuraEnabled
    public static List<Account> getAccount(){
        return [
           SELECT
            	id,
            	name
            FROM
            	Account
            LIMIT
            	10
        ];
    }
    @AuraEnabled
    public static void getData(String name){
        System.debug('Name : ' + name);
    }
}