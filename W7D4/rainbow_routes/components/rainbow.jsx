import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';
import Indigo from './indigo';
import Yellow from './yellow';
import Orange from './orange';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
          <NavLink to="./red" activeClassName="active" >Red</NavLink>
          <NavLink to="./green" activeClassName="active">Green</NavLink>
          <NavLink to='./blue' activeClassName="active">Blue only</NavLink>
          <NavLink to='./blue/indigo' activeClassName="active">Add indigo</NavLink>
          <NavLink to="./violet" activeClassName="active">Violet</NavLink>
          <NavLink to="./red/yellow" activeClassName="active">Add Yellow</NavLink>
          <NavLink to="./red/orange" activeClassName="active">Add Orange</NavLink>


        <div id="rainbow">
          <Route exact path="/red" component={Red} />
          <Route path="/green" component={Green} />
          <Route path="/blue" component={Blue} />
          <Route path="/violet" component={Violet} />
          <Route exact path="./blue/indigo" component={Indigo} />
          <Route path="./red/yellow"component={Yellow} />
          <Route path="./red/orange" component={Orange} />
        </div>
      </div>
    );
  }
}

export default Rainbow;
