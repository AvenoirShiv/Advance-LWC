public with sharing class SObjectWrapper {
    @AuraEnabled
    public String label;
    @AuraEnabled
    public String value;

    public SObjectWrapper(String label ,String apiName) {
        this.label = label;
        this.value = apiName;
    }
}