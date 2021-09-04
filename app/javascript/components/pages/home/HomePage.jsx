import React, { Component } from 'react';
import Uploader from '../../shared/uploader';
import 'bootstrap/dist/css/bootstrap.min.css';

class HomePage extends Component {
    render() {
      return (
        <div>
            <Uploader></Uploader>
            <Uploader></Uploader>
        </div>
      );
    }
  }
  
export default HomePage;