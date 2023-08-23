public with sharing class SObjectProcessor {
    public List<SObjectWrapper> getRelatedSObjects() {
        List<SObjectWrapper> sobjectApiNameToLabel = new List<SObjectWrapper>();
        for (Schema.SObjectType sobjectType : new SObjectDomain().getSObjectApiNameToLabel()) {
            Schema.DescribeSObjectResult sobjectDescribe = sobjectType.getDescribe();
            if (sobjectDescribe.isAccessible()) {
                if (sobjectDescribe.isCustom() && !sobjectDescribe.isCustomSetting()) {
                    sobjectApiNameToLabel.add(
                        new SObjectWrapper(
                            sobjectDescribe.getLabel(),
                            sobjectDescribe.getName()
                        )
                    );
                }
                else if (Taggable_Standard_Object__c.getInstance(sobjectDescribe.getName().toUpperCase()) != null) {
                    sobjectApiNameToLabel.add(
                        new SObjectWrapper(
                            sobjectDescribe.getLabel(),
                            sobjectDescribe.getName()
                        )
                    );
                }
                
            }
        }
        return sobjectApiNameToLabel;
    }
}