export const restaurantBookingModal = () => {
  const btn = document.querySelector(".trigger-btn");
  const modal = document.querySelector(".modal-body");
  if (btn) {
    btn.addEventListener("click", () => {
      modal.lastElementChild.style.display = "none"
      modal.insertAdjacentHTML("beforeEnd", `<div class="modal-body">
                          <p class="text-center"> Your booking has been confirmed! <br> Check your email for details. </p>
                        </div>
                        `);
    })
  }
}

