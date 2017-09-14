import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';

class Red extends React.Component {
  render() {
    return(
      <div>
        <h2 className="red"></h2>
        <Link to="/red/orange">Add Orangen</Link>
        <Route path="/red/orange" component={Orange} />

        <Link to="/red/yellow">Add Yellow</Link>
        <Route path="/red/yellow" component={Yellow} />
      </div>
    );
  }
}

export default Red;

// 1) link to"" defines where to go when clicked
// 2) route defines that when A, path=""  is accessed, render B, component
