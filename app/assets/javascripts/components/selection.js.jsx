var Selection = React.createClass({

  getDefaultProps: function() {
    return {
      selections:[],
      editSelection: function () {}
    }
  },

  listItem: function(select) {
    return(
      <li value={select.id}> {select.source} --- {select.name}
        <a className="pointer" data-id={select.id} onClick={this.props.editSelection}>edit</a>
      </li>
    );
  },

  render: function () {
    return (
      <ul>
        { this.props.selections.map(this.listItem) }
      </ul>
    )
  }

})

