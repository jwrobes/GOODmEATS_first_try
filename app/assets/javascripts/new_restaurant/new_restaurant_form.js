var GM = GM || {};

GM.newRestaurantForm = GM.newRestaurantForm || (function($) {

  var init = function () {
      setMeatSelectHandler();
  };

  var  setMeatSelectHandler = function() {
    $('.js-meatSelect').on('change', function() {
      var $self = $(this);
      var meat = $self.val();
      loadSourceMeats($self, meat);
    });
  };

  var loadSourceMeats = function(self, meat) {
    var sourceMeatsSelect = $('.js-sourceMeatsSelect');
    $.ajax({
      type: 'GET',
      url: "/ajax/get_source_meats/",
      data: { meat: meat},
      async: true
    }).done(function(data) {
      addDataToSelectForm(data, sourceMeatsSelect, buildSourceMeatsOptionsCallback);
      // setSourceMeatsSelectHandler();
    });
  };

  var addDataToSelectForm = function(data, $selectForm, buildOptionsCallback) {
    removeFormOptions($selectForm); 
    buildOptionsCallback(data, $selectForm);
    showSelectForm($selectForm);

  };

  var showSelectForm = function($selectForm) {
    $selectForm.removeClass('dn');
  };

  var removeFormOptions = function ($selectForm) {
    $selectForm.find('option').remove(); 
  };

  var addOptionLabel = function ($selectForm, formOption) {
    var optionString = formOption.toString();
    var optionLabelMarkup= '<option>Select a GoodmEat</option';
    $selectForm.append(optionLabelMarkup);
  };

  var  buildSourceMeatsOptionsCallback = function (data, $sourceMeatSelect) {
    var optionLabel = 'Local Meat';
    addOptionLabel($sourceMeatSelect, optionLabel);
    for(i=0; i < data.length; i++){
      $sourceMeatSelect.append('<option data-id="'+data[i].id+'" data-value="'+data[i].name+'">'+data[i].name+' from '+data[i].source+'</option>');
    }
  };

  return {
    init: init
  }

})(jQuery);

