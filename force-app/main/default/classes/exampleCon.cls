public class exampleCon {
    public string state {get;set;}
    public Account NewAccount {get;set;}
    public exampleCon(){
        state = '';
        newAccount = new Account();
    }
    public PageReference calledFromVFPage(){
        String name = System.currentPageReference().getParameters().get('name');
        String phone = System.currentPageReference().getParameters().get('phone');
        Account newAccount1 = new Account();
        newAccount1.Name = name;
        newAccount1.Phone = phone;
        insert newAccount1;
        System.debug('newAccount1' + newAccount1.id);
        PageReference pg = new PageReference('/'+newAccount1.id);
        pg.setRedirect(true);
        return pg;
    }
}