public with sharing class SObjectDomain {
    
    public List<Schema.SObjectType> getSObjectApiNameToLabel() {
        return Schema.getGlobalDescribe().values();
    }  

}