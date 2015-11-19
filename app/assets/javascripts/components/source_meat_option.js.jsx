var SourceMeatOption = React.createClass({

  buildName: function() {
    return (this.props.sourceMeat.source + ' -- ' + this.props.sourceMeat.name);
  },

  render: function() {
    return (
      <option className="" value={JSON.stringify(this.props.sourceMeat)}> {this.buildName() } </option>
    )
  }
});
