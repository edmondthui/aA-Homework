document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });


  
  // adding SF places as list items
  const new_place = (e) => {
    e.preventDefault();
    let input = document.querySelector('.favorite-input');
    let input_value = input.value;
    input.value = "";
    let new_place_li = document.createElement('li');
    new_place_li.textContent = input_value;
    let list = document.getElementById("sf-places");
    list.appendChild(new_place_li);
  }
  
  let submit_button = document.querySelector(".favorite-submit");
  submit_button.addEventListener("click", new_place);



  // adding new photos
  const show_new_photos = (e) => {
    let container = document.querySelector('.photo-form-container');
    if (container.className=== "photo-form-container") {
      container.className = "photo-form-container hidden";
    } else {
      container.className = "photo-form-container"
    }
  };

  let new_photo_button = document.querySelector(".photo-show-button");
  new_photo_button.addEventListener('click',show_new_photos);

  const submit_photo = (e) => {
    e.preventDefault();
    let photo_url_input = document.querySelector('.photo-url-input');
    let photo_url = photo_url_input.value;
    photo_url_input.value = "";
    let new_image = document.createElement('img');
    new_image.src = photo_url;
    let new_image_li = document.createElement('li');
    new_image_li.appendChild(new_image);
    let dog_photos = document.querySelector('.dog-photos');
    dog_photos.appendChild(new_image_li);
  }

  let photo_submit_button = document.querySelector('.photo-url-submit');
  photo_submit_button.addEventListener('click', submit_photo);

});