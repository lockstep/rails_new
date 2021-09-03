import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import HomePage from "../pages/home/HomePage";
import PropertiesPage from "../pages/properties/PropertiesPage";

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={HomePage} />
      <Route path="/properties" exact component={PropertiesPage} />
    </Switch>
  </Router>
);