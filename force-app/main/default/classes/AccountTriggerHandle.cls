public class AccountTriggerHandle {
    public static void createContactRecord(List<Account> listOfAccount){
        List<Contact> listOfContactToInsert = new List<Contact>();
        for(Account currentAccount : listOfAccount) {
            if(currentAccount.Number_of_Contacts__c > 10){
                currentAccount.Number_of_Contacts__c.addError('Account cannot have more then 10 contacts');
            }
            else if(currentAccount.Number_of_Contacts__c != null) {
                for(integer i = 0 ; i< currentAccount.Number_of_Contacts__c; i++){
                    Contact newContact = new Contact();
                    newContact.LastName = currentAccount.Name + ' Contact ' + i;
                    newContact.AccountId = currentAccount.Id;
                    listOfContactToInsert.add(newContact);
                }
            }
        }
        if(listOfContactToInsert.size() > 0) {
            insert listOfContactToInsert;
        }
    }
}