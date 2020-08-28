export const gymBookingModal = () => {
  const btns = document.querySelectorAll(".trigger-btn-gym");
  btns.forEach((btn) => {
    btn.addEventListener("click", () => {
      btn.closest(".modal-body").lastElementChild.style.display = "none"
      btn.closest(".modal-body").insertAdjacentHTML("beforeEnd", `<div class="modal-body">
                          <p class="text-center">Your booking has been confirmed. Check your email for details.</p>
                        </div>
                        <div class="modal-footer">
                          <a class="btn btn-secondary btn-sm" href="/gyms">Back to Gyms</a>
                          <a class="btn btn-primary btn-sm" href="/dashboard">My Bookings</a>
                        </div>`);
    })
  });
}

