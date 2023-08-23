public class actionFunctionController {
    public string testData {set;get;}
    public List<wrapperclass> accountList {set;get;}
    public string accountListJson {set;get;}
    public actionFunctionController(){
        accountList = new List<wrapperclass>();
        accountListJson = '';
        testData = 'shiv\'s';
        List<Account> newAccountList = [Select id, Name from Account];
        for(account currentAccount : newAccountList) {
            wrapperclass wrp = new wrapperclass();
            wrp.name = currentAccount.name;
            wrp.accId = currentAccount.id;
            accountList.add(wrp);
        }
        accountListJson = JSON.serialize(accountList);
    }
}