var Option = React.createClass({

  render: function() {
    return (
      <option className="" value={this.props.option.id}> {this.props.option.name} </option>
      )
  }
});
