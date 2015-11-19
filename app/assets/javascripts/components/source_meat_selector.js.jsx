var SourceMeatSelector = React.createClass({

  getDefaultProps: function() {
    return {
      selectedSourceMeats:[],
    }
  },

  getInitialState: function () {
    return {
      sourceMeats: []
    }
  },

  getSourceMeats: function () {
    $.ajax({
      url: "/ajax/get_source_meats/",
      data: {meat: this.state.meat},
      dataType: 'json',
      success: function (data) {
        this.setState({sourceMeats: data });
      }.bind(this),
      error: function (xhr, status, err) {
        console.error('ajax/get_source_meats', status, err.toString());
      }.bind(this)
    });
  },

  onMeatSelect: function (event) {
    var selectedMeat = event.target.value;
    this.setState({
      meat: selectedMeat
    }, function() {this.getSourceMeats()});
  },

  shouldShowSourceMeatsSelect: function () {
    return this.state.sourceMeats.length > 0;
  },

  filteredSourceMeats: function (){
    var selectedSourceMeats = this.props.selectedSourceMeats;
    return  _.filter(this.state.sourceMeats, function(sm) {
      var noMatch = true;
      _.each(selectedSourceMeats, function (ssm) {
        if (_.isEqual(sm, ssm)) {
         noMatch = false; 
        }
      })
      return noMatch;
    })
  },

  renderSourceMeatsSelect: function () {
    return (
      <select className="form-control" onChange={this.props.onSourceMeatSelect}>
        { this.renderOption({value: '', name: 'Select GOODmEAT' }) }
        { this.filteredSourceMeats().map(this.renderSourceMeatOption) }
      </select>
    );
  },

  renderSourceMeatsSelectIfNecessary: function () {
    if (this.shouldShowSourceMeatsSelect()) {
      return this.renderSourceMeatsSelect();
    }
  },

  renderMeatsSelect: function () {
    return (
      <select className="form-control" onChange={this.onMeatSelect}>
        { this.renderOption({value: '', name: 'Select mEAT' }) }
        { this.props.meats.map(this.renderOption) }
      </select>
    );
  },

  renderOption: function(obj) {
     return (<Option option={obj} />)
  },

  renderSourceMeatOption: function(option) {
     return ( <SourceMeatOption sourceMeat={option} /> )
  },

  render: function() {
    return (
      <div className="new-restaurant">
        { this.renderMeatsSelect() }
        { this.renderSourceMeatsSelectIfNecessary() }
      </div>
    )
  }
});
