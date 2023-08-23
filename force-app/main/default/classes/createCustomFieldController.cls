public with sharing class createCustomFieldController {
   @AuraEnabled(cacheable = true)
   public static List<SObjectWrapper> getSObjects(){
        try {
            SObjectProcessor processor = new SObjectProcessor();
            return processor.getRelatedSObjects();
        } 
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
   }
   @AuraEnabled
   public static void createFields(String inputData, String objectName){
        try {
            List<fieldWrapper> fieldWrappers = new List<fieldWrapper>();
            fieldWrappers =  (List<fieldWrapper>)JSON.deserialize(inputData, List<fieldWrapper>.class);
            MetadataServiceHandler.createDifferentTypeField(fieldWrappers, objectName);
        } 
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
   }
}