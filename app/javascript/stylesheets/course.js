// // import axios from 'axios'
// import httpClient from 'lib/http/client'

// document.addEventListener('turbolinks:load', function(){
//   const like_btn = document.querySelector('#like-btn')

//   if(like_btn){
//     like_btn.addEventListener('click', function(){
//       const courseID = like_btn.dataset.id
//       // console.log(courseID);

//       // Step 1：
//       // axios.get("https://randomuser.me/api/?results=5").then(function(resp){
//       //   console.log(resp);
//       // })

//       // Step ２：
//       // axios.get("https://randomuser.me/api/?results=5").then(function({data}){
//       //   console.log(data.results);
//       // })

//       // Step ３：
//       // v1:加新功能時，回傳的結果和參數都不一樣的話，其他人會很難用，所以透過API進行版本控管
//       httpClient.post(`/api/v1/courses/${courseID}/like`).then(function({data}){
//         console.log(data);
//         if (data.status === "like"){
//           like_btn.classList.add("favorite")
//         } else{
//           like_btn.classList.remove("favorite")
//         }
//       })
//     })
//   }

//   // like_btn && like_btn.addEventListener('click', function(){
//   //   console.log('hello');
//   // })
// })