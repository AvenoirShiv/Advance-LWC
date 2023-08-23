({
	handleEvent : function(component, event, helper) {
        var message = event.getParam("message");
        component.set("v.MessageFromNotifer", message);
        var count = parseInt(component.get("v.counter") + 1)
        
        component.set("v.counter",count);
		
	}
})