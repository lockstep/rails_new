import React, { Component } from "react";
import Form from "react-bootstrap/Form"
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min';

class Uploader extends Component {

  constructor(props) {
    super(props);
    this.formControlRef = React.createRef();
  }

  handleSubmit = (event) => {
    console.log(this.formControlRef.current.value)// can get callback data here
 }
 

  render() {
    return (
      <div>
        <Form>
          <Form.Group controlId="formFile" className="mb-3">
              <Form.Label>Default file input example</Form.Label>
              <Form.Control type="file" ref={this.formControlRef} onChange={this.handleSubmit} />
          </Form.Group>
        </Form>
      </div>
    );
  }
}

export default Uploader;