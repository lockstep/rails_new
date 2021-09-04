import React from "react";
import { render } from "react-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min';

import App from "../components/App";
import {BrowserRouter as Router, Route} from 'react-router-dom'
document.addEventListener("DOMContentLoaded", () => {
  render(
    <App></App>,
    document.body.appendChild(document.createElement("div"))
  );
});