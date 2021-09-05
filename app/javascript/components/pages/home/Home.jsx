import React, { Component } from 'react';
import Uploader from '../../shared/uploader';

class Home extends Component {
    render() {
      return (
        <div>
            <Uploader></Uploader>
            <Uploader></Uploader>
        </div>
      );
    }
  }
  
export default Home;