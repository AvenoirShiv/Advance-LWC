({
	doInit : function(component, event, helper) {
        component.set("v.columns",
                      [
                          {"label" : "Account Id", "fieldName" : "Id" , "type" : "text"},
                          {"label" : "Account Name", "fieldName" : "Name" , "type" : "text"} 
                      ]
                     );
        let action = component.get("c.getAccount");
        action.setCallback(this, function(res){
            let state = res.getState();
            if(state === "SUCCESS") {
                component.set("v.accountList", res.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})