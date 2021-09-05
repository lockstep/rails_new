import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../pages/home/Home";
import Properties from "../pages/properties/Properties";
import {Navbar} from 'react-bootstrap'

import Button from 'react-bootstrap/Button';

export default (
  <Router>
  <Button>Hello</Button>
  <Navbar bg="light" expand="lg">
  <Navbar.Brand href="#home">React-Bootstrap</Navbar.Brand>

  </Navbar>
    <Switch>
      <Route path="/" component={Home} />
      <Route path="/properties" exact component={Properties} />
    </Switch>
  </Router>
);