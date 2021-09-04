import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import HomePage from "../pages/home/HomePage";
import PropertiesPage from "../pages/properties/PropertiesPage";

export default (
  <div>
  <h1>Router</h1>
  <PropertiesPage/>
  {/* <Switch>
    <Route path="/" exact component={HomePage} />
    <Route path="/properties" exact component={PropertiesPage} />
  </Switch> */}
  </div>

);