export const restaurantBookingModal = () => {
  const btn = document.querySelector(".trigger-btn");
  const modal = document.querySelector(".modal-body");
  if (btn) {
    btn.addEventListener("click", () => {
      modal.innerHTML = `<div class="modal-body">
                          <p class="text-center">Your booking has been confirmed. Check your email for details.</p>
                        </div>
                        <div class="modal-footer">
                          <a class="btn btn-primary btn-sm" href="/dashboard">My Bookings</a>
                          <a class="btn btn-secondary btn-sm" href="/restaurants">Back to Restaurants</a>

                        </div>`;
    })
  }
}

