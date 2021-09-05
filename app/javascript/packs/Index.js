import React from "react";
import { render } from "react-dom";

import App from "../components/App";


import Button from 'react-bootstrap/Button';




document.addEventListener("DOMContentLoaded", () => {
  render(
    <div>
      <Button>Hello</Button>
      <App>

      </App>
    </div>,
    document.body.appendChild(document.createElement("div"))
  );
});