import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            search: ""
        }
        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleChange(e) {
        this.setState({ search: e.currentTarget.value})
    }

    handleSubmit(e) {
        e.preventDefault();
        let searchTerm = this.state.search.split(" ").join("+")
        this.props.fetchSearchGiphys(searchTerm)
    }

    render () {
        return (
            <div>
                <form onSubmit={this.handleSubmit}>
                    <input type="text" onChange={this.handleChange}/>
                    <input type="submit" value="Submit"/>
                </form>
                <GiphysIndex giphys={this.props.giphys}/>
            </div>
        )
    }
}

export default GiphysSearch