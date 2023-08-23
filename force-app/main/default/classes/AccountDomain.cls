public with sharing class AccountDomain {
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts(){
        try {
            return [
                SELECT
                    Id,
                    Name
                FROM
                    Account
                ORDER BY 
                    Name
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static void linkAccount(List<String> accountIds){
        try {
            System.debug('Account Ids: ' + accountIds);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}