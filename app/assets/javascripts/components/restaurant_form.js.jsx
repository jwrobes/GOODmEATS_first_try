var RestaurantForm = React.createClass({

  getInitialState: function () {
    return {
      selectedSourceMeats: [],
      shouldShowSourceMeatSelector: true,
      showSubmit: false,
    };
  },

  buildNestedData: function() {
    var nestedData =  this.props.restaurant;
    var sourceMeatData = this.buildSourceMeatData();
    nestedData["restaurant_meats_attributes"] = sourceMeatData;
      return {restaurant: nestedData};
  },

  buildSourceMeatData: function () {
    var data = {};
    this.state.selectedSourceMeats.map(function (sourceMeat, i) {
     data[i] = { source_meat_id: sourceMeat.id };
    })
    return data;
  },

  onSourceMeatSelect: function(e) {
    var selectedSourceMeat = JSON.parse(e.target.value);
    var newSelectedSourceMeats = this.state.selectedSourceMeats;
    newSelectedSourceMeats.push(selectedSourceMeat);
    this.setState({
      shouldShowSourceMeatSelector: false,
      selectedSourceMeats: newSelectedSourceMeats
    })
  },

  submitForm: function () {
    var data = this.buildNestedData();
    $.ajax({
      url: "/restaurants",
      method: 'POST',
      data: data,
      dataType: 'json',
      success: function (xhr) {
          console.log('Success');
      }.bind(this),
      error: function (xhr, status, err) {
        console.error('/getsources/create', status, err.toString());
      }.bind(this)
    });
  },
  
  renderSourceMeatSelector: function() {
      return(
        < SourceMeatSelector meats={this.props.meats}
        onSourceMeatSelect={this.onSourceMeatSelect}
        selectedSourceMeats={this.state.selectedSourceMeats}
        />
      )
  },

  showSourceMeatSelector: function () {
    this.setState({shouldShowSourceMeatSelector: true})
  },

  renderSourceMeatSelectorIfNecessary: function() {
    if (this.state.shouldShowSourceMeatSelector) {
      return this.renderSourceMeatSelector();
    }
  },

  editSelection: function(e) {
    var idToEdit = e.target.dataset.id
    var filteredMeats = this.state.selectedSourceMeats.filter(function(selection) {
         return selection.id != idToEdit;
    });
    this.setState({
      selectedSourceMeats: filteredMeats,
      shouldShowSourceMeatSelector: true
    })
  },

  sourceMeatSelected: function() {
    return this.state.selectedSourceMeats.length > 0;
  },

  renderSelections: function() {
    return ( < Selection selections={this.state.selectedSourceMeats}
            editSelection={this.editSelection} />
           )
  },

  renderSelectionsIfNecessary: function() {
    if (this.sourceMeatSelected() ) {
      return this.renderSelections();
    }
  },

  renderAddMoreGoodMeat: function() {
    return (<p>
      <a onClick={this.showSourceMeatSelector}>Add another GOODmEAT!</a>
    </p> )
  },

  renderAddMoreGoodMeatIfNecessary: function() {
    if (this.sourceMeatSelected() ) {
      return this.renderAddMoreGoodMeat();
    }
  },

  renderSubmitButton: function () {
    return (<div> 
      <button className="btn btn-primary" onClick={this.submitForm}>
        Submit
      </button>
    </div>)
  },

  renderSubmitButtonIfNecessary: function() {
    if (this.sourceMeatSelected() ) {
      return this.renderSubmitButton();
    }
  },

  render: function() {
    return (
      <div className="new-restaurant">
        { this.renderSelectionsIfNecessary() }
        { this.renderSourceMeatSelectorIfNecessary() }
        { this.renderAddMoreGoodMeatIfNecessary() }
        { this.renderSubmitButtonIfNecessary() }
      </div>
    )
  }
});
