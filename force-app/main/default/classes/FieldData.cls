public with sharing class FieldData {

    @AuraEnabled
    public String label;
    @AuraEnabled
    public String value;
    @AuraEnabled
    public String type;

    public FieldData(String label, String value, String type) {
        this.label = label;
        this.value = value;
        this.type = type;
    }

}