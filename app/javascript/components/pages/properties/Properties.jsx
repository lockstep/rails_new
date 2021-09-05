import BootstrapTable from 'react-bootstrap-table-next';
import React, { Component } from 'react';

const products = [ 
  {"name" : "hello", "country": "hi", "rent": 123, "external_id": 1,
  "city": "england", "acquisition price": 12, "leasble_area": 123,
  "acquired_on": "12/20/2021"},
];

const columns = [{
  dataField: 'name',
  text: 'Property Name'
}, {
  dataField: 'country',
  text: 'Country'
}, {
  dataField: 'rent',
  text: 'Monthly Rent'
}];


console.log("hello")


class Properties extends Component {
  render() {
    return (
      <BootstrapTable keyField='name' data={ products } columns={ columns } />
    );
  }
}

export default Properties;