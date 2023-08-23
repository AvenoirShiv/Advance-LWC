public class ContactTriggerHandler {
    public static void handleBeforeInsert(List<Contact> contacts){
        Set<Id> accountIds = new Set<Id>();
        for (Contact currentContact : contacts) {
            if (currentContact.AccountId != null) {
               accountIds.add(currentContact.AccountId);
            }
        }
        List<Account> accounts = [
            SELECT
            	Id,
            	(
                    SELECT
                    	Id
                    FROM
                    	Contacts
                )
            FROM
            	Account
            WHERE
            	Id IN :accountIds
        ];
        Map<Id, Integer> accountIdToContactSize = new Map<Id, Integer>();
        for (Account currentAccount : accounts) {
            accountIdToContactSize.put(currentAccount.Id, currentAccount.Contacts.size());
        }
        for (Contact currentContact : contacts) {
            if(currentContact.AccountId != null) {
                if (accountIdToContactSize.containsKey(currentContact.AccountId) 
                    	&& accountIdToContactSize.get(currentContact.AccountId) >= 5 
                   ) {
                    currentContact.addError('Sorry Account cannot have more then 5 contacts');
                }
                else {
                    accountIdToContactSize.put(
                        currentContact.AccountId, accountIdToContactSize.get(currentContact.AccountId) + 1
                    );
                }
            }
        }
    }
}