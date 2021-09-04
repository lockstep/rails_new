// // provider.js

// import axios from 'axios'; 
// import { handleResponse, handleError } from './response'; 

// // Define your api url from any source.
// // Pulling from your .env file when on the server or from localhost when locally
// const BASE_URL = 'http://127.0.0.1:3333/api/v1'; 

// /** @param {string} resource */ 
// const getAll = (resource) => { 
//   return axios 
//     .get(`${BASE_URL}/${resource}`) 
//     .then(handleResponse) 
//     .catch(handleError); 
// }; 

// /** @param {string} resource */ 
// /** @param {string} id */ 
// const getSingle = (resource, id) => { 
//   return axios 
//     .get(`${BASE_URL}/${resource}/${id}`) 
//     .then(handleResponse) 
//     .catch(handleError); 
// }; 

// /** @param {string} resource */ 
// /** @param {object} model */ 
// const post = (resource, model) => { 
//   return axios 
//     .post(`${BASE_URL}/${resource}`, model) 
//     .then(handleResponse) 
//     .catch(handleError); 
// }; 

// export const apiProvider = { 
//     getAll, 
//     getSingle, 
//     post
// }