var Meat  = {
	init: function () {
		$('.new-meat').on('click', function(){
		$('.meat-form').on('click', this.submitMeatForm)	
		})
	},
	submitMeatForm: function() {
		$('#select-meat-form').submit();
	}


}