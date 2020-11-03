import React from 'react';

class Calculator extends React.Component {
    constructor(props) {
        super(props)
        this.state = { num1: "", num2: "", result: 0};
        this.setNum1 = this.setNum1.bind(this);
        this.setNum2 = this.setNum2.bind(this);
        this.clear = this.clear.bind(this);
        this.add = this.add.bind(this);
        this.times = this.times.bind(this);
        this.subtract = this.subtract.bind(this);
        this.divide = this.divide.bind(this);
    }

    setNum1(e) {
        this.setState( {num1: e.currentTarget.value})
    }

    setNum2(e) {
        this.setState( {num2: e.currentTarget.value})
    }

    add(e) {
        e.preventDefault();
        let result = parseFloat(this.state.num1) + parseFloat(this.state.num2);
        this.setState( {result})
    }

    clear(e) {
        e.preventDefault();
        this.setState( {num1: "", num2: "", result: 0});
    }

    times(e) {
        e.preventDefault();
        let result = parseFloat(this.state.num1) * parseFloat(this.state.num2);
        this.setState( {result})
    }

    subtract(e) {
        e.preventDefault();
        let result = parseFloat(this.state.num1) - parseFloat(this.state.num2);
        this.setState( {result} )
    }

    divide(e) {
        e.preventDefault();
        let result = parseFloat(this.state.num1) / parseFloat(this.state.num2);
        this.setState({result})
    }

    render () {
        return (
            <div>
                <input onChange={this.setNum1} value={this.state.num1}/>
                <input onChange={this.setNum2} value={this.state.num2}/>
                <button onClick={this.clear}>Clear</button>
                <br/>
                <button onClick={this.add}>+</button>
                <button onClick={this.times}>*</button>
                <button onClick={this.subtract}>-</button>
                <button onClick={this.divide}>/</button>
                <h1>{this.state.result}</h1>
            </div>
        )
    }
}

export default Calculator;

