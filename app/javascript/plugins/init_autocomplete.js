import places from 'places.js';

const initGymAutocomplete = () => {
  const addressInput = document.getElementById('gym_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const initRestAutocomplete = () => {
  const addressInput = document.getElementById('restaurant_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initGymAutocomplete };
export { initRestAutocomplete };