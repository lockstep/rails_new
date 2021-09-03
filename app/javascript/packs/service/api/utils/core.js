// // core.js

// import apiProvider from './provider';

// export class ApiCore {
//   constructor(options) {
//     if (options.getAll) {
//       this.getAll = () => {
//         return apiProvider.getAll(options.url);
//       };
//     }

//     if (options.getSingle) {
//       this.getSingle = (id) => {
//         return apiProvider.getSingle(options.url, id);
//       };
//     }

//     if (options.post) {
//       this.post = (model) => {
//         return apiProvider.post(options.url, model);
//       };
//     }
//   }
// }