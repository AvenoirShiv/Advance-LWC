public class GetAllSobject {
    public static List<String> getSObjects(){
        List<String> allSobjects = new List<String>();
        for (Schema.SObjectType obj : Schema.getGlobalDescribe().values()) {
            Schema.DescribeSObjectResult objectResult = obj.getDescribe();
            if (objectResult.isAccessible()) {
                System.debug(objectResult);
                if (objectResult.isCustom() && !objectResult.isCustomSetting()) {
                    allSobjects.add(objectResult.getName().toUpperCase());
                }
                else if (Taggable_Standard_Object__c.getInstance(objectResult.getName().toUpperCase()) != null) {
                    allSobjects.add(objectResult.getName().toUpperCase());
                }
            }
        }
        return allSobjects;
    }
}