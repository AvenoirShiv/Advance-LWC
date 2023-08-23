({
	showMethodFromHelper : function(component, event) {
        console.log("Working");
        var params = event.getParam("arguments");
        console.log(params.message);
	}
})