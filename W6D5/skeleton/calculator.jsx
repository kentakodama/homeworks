import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = { result: 0, num1: '', num2: '' };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);

  }
  setNum1(e) {
  // your code here
    debugger


  }
  // your code here
  setNum2(e) {
  // your code here
  }
  // your code here


  render() {
   return (
     <div>
       <input onChange={this.setNum1}></input>
       <h1>{this.state.result}</h1>
     </div>
   );
 }
}

export default Calculator;
