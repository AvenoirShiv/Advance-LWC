({
	doInit : function(component, event, helper) {
        component.set("v.childVariable","This is provided by init method");
	},
    sendData : function(component , event , helper) {
        let action = component.get("c.getData");
        action.setParams({"name" : component.get("v.username")});
        action.setCallback(this, function(res) {
			let state = res.getState();
            if(state === "SUCCESS"){
                
            }            
        });
        $A.enqueueAction(action);
    },
    showMessage : function(component, event, helper){
        helper.showMessageFromHelper(component, event);
    }
})